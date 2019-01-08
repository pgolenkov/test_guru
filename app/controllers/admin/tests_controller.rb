class Admin::TestsController < Admin::ApplicationController
  before_action :find_test, only: [:show, :edit, :update, :destroy]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = current_user.own_tests.build
  end

  def edit
  end

  def create
    @test = current_user.own_tests.build(test_params)
    if @test.save
      redirect_to [:admin, @test], notice: t(".success", title: @test.title)
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: t(".success")
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t(".success", title: @test.title)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
