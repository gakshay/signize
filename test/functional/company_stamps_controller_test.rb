require 'test_helper'

class CompanyStampsControllerTest < ActionController::TestCase
  setup do
    @company_stamp = company_stamps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_stamps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_stamp" do
    assert_difference('CompanyStamp.count') do
      post :create, :company_stamp => @company_stamp.attributes
    end

    assert_redirected_to company_stamp_path(assigns(:company_stamp))
  end

  test "should show company_stamp" do
    get :show, :id => @company_stamp.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @company_stamp.to_param
    assert_response :success
  end

  test "should update company_stamp" do
    put :update, :id => @company_stamp.to_param, :company_stamp => @company_stamp.attributes
    assert_redirected_to company_stamp_path(assigns(:company_stamp))
  end

  test "should destroy company_stamp" do
    assert_difference('CompanyStamp.count', -1) do
      delete :destroy, :id => @company_stamp.to_param
    end

    assert_redirected_to company_stamps_path
  end
end
