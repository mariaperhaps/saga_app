require 'test_helper'

class SagasControllerTest < ActionController::TestCase
  setup do
    @saga = sagas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sagas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saga" do
    assert_difference('Saga.count') do
      post :create, saga: { title: @saga.title, user_id: @saga.user_id }
    end

    assert_redirected_to saga_path(assigns(:saga))
  end

  test "should show saga" do
    get :show, id: @saga
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saga
    assert_response :success
  end

  test "should update saga" do
    patch :update, id: @saga, saga: { title: @saga.title, user_id: @saga.user_id }
    assert_redirected_to saga_path(assigns(:saga))
  end

  test "should destroy saga" do
    assert_difference('Saga.count', -1) do
      delete :destroy, id: @saga
    end

    assert_redirected_to sagas_path
  end
end
