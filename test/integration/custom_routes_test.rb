
require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "that /login route open the login page" do
  	get '/login'
  	assert_response :success
  end

  test "that /logout route open the login page" do
  	get '/logout'
  	assert_response :redirect
  	assert_redirected_to '/'
  end

  test "that /register route open the login page" do
  	get '/register'
  	assert_response :success
  end

  test "that a profile page works" do
    get '/jim'
    assert_response :success
  end
end
