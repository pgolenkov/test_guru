class BadgeCheckService
  def initialize(test_passage)
    @test_passage = test_passage
    @badges = Badge.all
  end

  def call
    @badges.select { |badge| success?(badge.badge_rule) }
  end

  private

  def success?(badge_rule)
    return false unless @test_passage.success?

    send("success_#{badge_rule.kind}?", { test: badge_rule.test,
                                          category: badge_rule.category,
                                          level: badge_rule.level })
  end

  def success_specific_test?(options)
    test = options[:test]
    test.nil? || @test_passage.test_id == test.id
  end

  def success_all_tests_in_category?(options)
    category = options[:category]
    return false unless category.present?
    return false unless category_id == @test_passage.test.category_id

    success_tests = prev_test_passages.in_category(category).select(&:success?).map(&:test).uniq

    success_tests.count + 1 == category.tests.count ? true : false
  end

  def success_all_tests_in_level?(options)
    level = options[:level]
    return false unless level.present?
    return false unless level == @test_passage.test.level

    success_tests = prev_test_passages.by_level(level).select(&:success?).map(&:test).uniq

    success_tests.count + 1 == Test.by_level(level).count ? true : false
  end

  def success_first_try?(options)
    test = options[:test]
    return false if test && @test_passage.test_id != test.id

    prev_test_passages.where(test: @test_passage.test).empty?
  end

  def prev_test_passages
    @test_passage.user.test_passages.where('test_passages.id < ?', @test_passage.id)
  end
end
