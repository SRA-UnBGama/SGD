require 'test_helper'

class WorkingConditionsControllerTest < ActionController::TestCase
  setup do
    @working_condition = working_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:working_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create working_condition" do
    assert_difference('WorkingCondition.count') do
      post :create, working_condition: { description_working_condition: @working_condition.description_working_condition, name: @working_condition.name, value_working_condition: @working_condition.value_working_condition }
    end

    assert_redirected_to working_condition_path(assigns(:working_condition))
  end

  test "should show working_condition" do
    get :show, id: @working_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @working_condition
    assert_response :success
  end

  test "should update working_condition" do
    patch :update, id: @working_condition, working_condition: { description_working_condition: @working_condition.description_working_condition, name: @working_condition.name, value_working_condition: @working_condition.value_working_condition }
    assert_redirected_to working_condition_path(assigns(:working_condition))
  end

  test "should destroy working_condition" do
    assert_difference('WorkingCondition.count', -1) do
      delete :destroy, id: @working_condition
    end

    assert_redirected_to working_conditions_path
  end
end
