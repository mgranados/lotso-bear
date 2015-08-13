# require 'test_helper'

# class FamilyLikelihoodsControllerTest < ActionController::TestCase
#   setup do
#     @family_likelihood = family_likelihoods(:one)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:family_likelihoods)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create family_likelihood" do
#     assert_difference('FamilyLikelihood.count') do
#       post :create, family_likelihood: {  }
#     end

#     assert_redirected_to family_likelihood_path(assigns(:family_likelihood))
#   end

#   test "should show family_likelihood" do
#     get :show, id: @family_likelihood
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @family_likelihood
#     assert_response :success
#   end

#   test "should update family_likelihood" do
#     patch :update, id: @family_likelihood, family_likelihood: {  }
#     assert_redirected_to family_likelihood_path(assigns(:family_likelihood))
#   end

#   test "should destroy family_likelihood" do
#     assert_difference('FamilyLikelihood.count', -1) do
#       delete :destroy, id: @family_likelihood
#     end

#     assert_redirected_to family_likelihoods_path
#   end
# end
