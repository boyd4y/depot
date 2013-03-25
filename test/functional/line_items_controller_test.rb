require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, line_item: {
        user_id: users(:one).id,
        activity_id: activities(:neverexpired_activity).id
      }
    end

    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should create line_item rest" do
    user_id = users(:two).id
    assert_difference('LineItem.count') do
      post :create, line_item: {
        user_id: user_id,
        activity_id: activities(:neverexpired_activity).id,
        format: :json
      }
    end
    
    assert_equal 99, User.find(user_id).credit
  end

  test "should show line_item" do
    get :show, id: @line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_item
    assert_response :success
  end

  test "should update line_item" do
    put :update, id: @line_item, line_item: { ship_address: @line_item.ship_address, ship_date: @line_item.ship_date, status: @line_item.status }
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item
    end

    assert_redirected_to line_items_path
  end
end
