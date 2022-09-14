require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: "Smith", password: 'secret', password_confirmation: 'secret' } }
    end

    assert_redirected_to login_url
  end

  test "should not create user when passwords don't match" do
    assert_no_difference('User.count') do
      post users_url, params: { user: { name: "Smith", password: 'secret', password_confirmation: 'terces' } }
    end 
    assert_response 422
  end

  test "should not create user when passwords are missing" do
    assert_no_difference('User.count') do
      post users_url, params: { user: { name: "Smith" } }
    end 
    assert_response 422
  end

  test "should not create user when name is not provided" do
    assert_no_difference('User.count') do
      post users_url, params: { user: { password: 'secret', password_confirmation: 'secret' } }
    end 
    assert_response 422
  end


end
