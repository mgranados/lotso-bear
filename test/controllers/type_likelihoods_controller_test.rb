# require 'test_helper'

# class TypeLikelihoodsControllerTest < ActionController::TestCase
#   setup do
#     @type_likelihood = type_likelihoods(:one)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:type_likelihoods)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create type_likelihood" do
#     assert_difference('TypeLikelihood.count') do
#       post :create, type_likelihood: {  }
#     end

#     assert_redirected_to type_likelihood_path(assigns(:type_likelihood))
#   end

#   test "should show type_likelihood" do
#     get :show, id: @type_likelihood
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @type_likelihood
#     assert_response :success
#   end

#   test "should update type_likelihood" do
#     patch :update, id: @type_likelihood, type_likelihood: {  }
#     assert_redirected_to type_likelihood_path(assigns(:type_likelihood))
#   end

#   test "should destroy type_likelihood" do
#     assert_difference('TypeLikelihood.count', -1) do
#       delete :destroy, id: @type_likelihood
#     end

#     assert_redirected_to type_likelihoods_path
#   end
# end
