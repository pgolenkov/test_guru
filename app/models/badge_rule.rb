class BadgeRule < ApplicationRecord
  belongs_to :badge, optional: true

  belongs_to :test, optional: true
  belongs_to :category, optional: true

  enum kind: {
    specific_test: 0,
    all_tests_in_category: 1,
    all_tests_in_level: 2,
    first_try: 3
  }

  def success?(test_passage)
    return false unless test_passage.success?

    send("success_#{kind}?", test_passage)
  end

  private

  def success_specific_test?(test_passage)
    test.nil? || test_passage.test_id == test_id
  end

  def success_all_tests_in_category?(test_passage)
    return false unless category.present?
    return false unless category_id == test_passage.test.category_id

    success_tests = prev_passages(test_passage).in_category(category).select(&:success?).map(&:test).uniq

    success_tests.count + 1 == category.tests.count ? true : false
  end

  def success_all_tests_in_level?(test_passage)
    return false unless level.present?
    return false unless level == test_passage.test.level

    success_tests = prev_passages(test_passage).by_level(level).select(&:success?).map(&:test).uniq

    success_tests.count + 1 == Test.by_level(level).count ? true : false
  end

  def success_first_try?(test_passage)
    return false if test && test_passage.test_id != test_id

    prev_passages(test_passage).where(test: test_passage.test).empty?
  end

  def prev_passages(test_passage)
    test_passage.user.test_passages.where('test_passages.id < ?', test_passage.id)
  end
end
