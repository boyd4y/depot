require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @update = { password: 'User@123', password_confirmation: 'User@123', phone: '1110' }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @update
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: @update
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

  test "signin failed with rest API" do
    # @newuser = { password: 'User@1231', phone: '110' }
    post :signin, phone: '110', password: 'User@1231', format: :json
    assert_response :unauthorized
  end

  test "signin pass with rest API" do
    # @newuser = { password: 'User@123', phone: '110' }
    post :signin, phone: '110', password: 'User@123', format: :json
    assert_response :ok
  end
end
