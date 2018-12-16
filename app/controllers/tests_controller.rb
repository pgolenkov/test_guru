class TestsController < ApplicationController
  def index
    @tests = Test.all
  end
end
