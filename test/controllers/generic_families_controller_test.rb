# require 'test_helper'

# class GenericFamiliesControllerTest < ActionController::TestCase
#   setup do
#     @generic_family = generic_families(:one)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:generic_families)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create generic_family" do
#     assert_difference('GenericFamily.count') do
#       post :create, generic_family: {  }
#     end

#     assert_redirected_to generic_family_path(assigns(:generic_family))
#   end

#   test "should show generic_family" do
#     get :show, id: @generic_family
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @generic_family
#     assert_response :success
#   end

#   test "should update generic_family" do
#     patch :update, id: @generic_family, generic_family: {  }
#     assert_redirected_to generic_family_path(assigns(:generic_family))
#   end

#   test "should destroy generic_family" do
#     assert_difference('GenericFamily.count', -1) do
#       delete :destroy, id: @generic_family
#     end

#     assert_redirected_to generic_families_path
#   end
# end
