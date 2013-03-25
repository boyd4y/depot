require 'test_helper'

class VariantsControllerTest < ActionController::TestCase
  setup do
    @variant = variants(:one)
    @update = { fullcode: 'testcode', password: '1234'}
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:variants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create variant" do
    assert_difference('Variant.count') do
      post :create, variant: @update
    end

    assert_redirected_to variant_path(assigns(:variant))
  end

  test "should show variant" do
    get :show, id: @variant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @variant
    assert_response :success
  end

  test "should update variant" do
    put :update, id: @variant, variant: @update
    assert_redirected_to variant_path(assigns(:variant))
  end

  test "should destroy variant" do
    assert_difference('Variant.count', -1) do
      delete :destroy, id: @variant
    end

    assert_redirected_to variants_path
  end

  test "verify pass with rest API" do
    post :verify, fullcode: 'FAC1PRD1XXXXXXXXXX1', password: '111', user_id: users(:one).id, format: :json
    assert_response :ok
    assert_equal true, json_response['result']
    assert_equal 100 + products(:one).point, json_response['credit']

    post :verify, fullcode: 'FAC1PRD1XXXXXXXXXX1', password: '111', user_id: users(:one).id, format: :json
    assert_response :ok
    assert_equal true, json_response['result']
    assert_equal 100 + products(:one).point, json_response['credit']

    post :verify, fullcode: 'FAC1PRD1XXXXXXXXXX1', password: '111', user_id: users(:two).id, format: :json
    assert_response :unprocessable_entity
    assert_equal false, json_response['result']
  end

  test "verify failed with rest API" do
    post :verify, fullcode:'FAC1PRD1XXXXXXXXXX1', password: '222', user_id: users(:one).id, format: :json
    assert_response :unprocessable_entity
    assert_equal false, json_response['result']
  end
end
