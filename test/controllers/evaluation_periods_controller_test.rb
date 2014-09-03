require 'test_helper'

class EvaluationPeriodsControllerTest < ActionController::TestCase
  setup do
    @evaluation_period = evaluation_periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluation_periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluation_period" do
    assert_difference('EvaluationPeriod.count') do
      post :create, evaluation_period: { end_date_evaluation: @evaluation_period.end_date_evaluation, start_date_evaluation: @evaluation_period.start_date_evaluation }
    end

    assert_redirected_to evaluation_period_path(assigns(:evaluation_period))
  end

  test "should show evaluation_period" do
    get :show, id: @evaluation_period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluation_period
    assert_response :success
  end

  test "should update evaluation_period" do
    patch :update, id: @evaluation_period, evaluation_period: { end_date_evaluation: @evaluation_period.end_date_evaluation, start_date_evaluation: @evaluation_period.start_date_evaluation }
    assert_redirected_to evaluation_period_path(assigns(:evaluation_period))
  end

  test "should destroy evaluation_period" do
    assert_difference('EvaluationPeriod.count', -1) do
      delete :destroy, id: @evaluation_period
    end

    assert_redirected_to evaluation_periods_path
  end
end
