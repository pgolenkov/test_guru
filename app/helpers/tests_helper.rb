module TestsHelper
  def test_header(test)
    if test.new_record?
      "Create New Test"
    else
      "Edit #{test.title} Test"
    end
  end
end
