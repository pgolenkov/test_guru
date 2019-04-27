class BadgeCheckService
  def initialize(test_passage)
    @test_passage = test_passage
    @badges = Badge.all
  end

  def call
    return [] unless @test_passage.success?
    @badges.select { |badge| success?(badge.rule) }
  end

  private

  def success?(badge_rule)
    send("success_#{badge_rule.kind}?", badge_rule.value)
  end

  def success_specific_test?(test_id)
    test_id.nil? || @test_passage.test_id == test_id
  end

  def success_all_tests_in_category?(category_id)
    category = Category.find_by(id: category_id)
    return false unless category.present?
    return false unless category.id == @test_passage.test.category_id

    success_tests = prev_test_passages.in_category(category).select(&:success?).map(&:test).uniq

    success_tests.count + 1 == category.tests.count ? true : false
  end

  def success_all_tests_in_level?(level)
    return false unless level.present?
    return false unless level == @test_passage.test.level

    success_tests = prev_test_passages.by_level(level).select(&:success?).map(&:test).uniq

    success_tests.count + 1 == Test.by_level(level).count ? true : false
  end

  def success_first_try?(test_id)
    return false if test_id && @test_passage.test_id != test_id

    prev_test_passages.where(test: @test_passage.test).empty?
  end

  def prev_test_passages
    @test_passage.user.test_passages.where('test_passages.id < ?', @test_passage.id)
  end
end
