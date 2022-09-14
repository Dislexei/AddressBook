require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url
    assert_response :success
  end


  test "should log in user" do
    user = users(:john)
    assert_nil user.token
    post login_url, params: { name: user.name, password: "secret" }
    user.reload
    assert_redirected_to root_path
    assert_not_nil user.token
  end


  test "should not log in user" do
    user = users(:john)
    post login_url, params: { name: user.name, password: "terces" }
    assert_redirected_to login_url
    user.reload
    assert_nil user.token
  end


  test "should log out" do
    user = User.create!(name: "Smith", password: 'secret', password_confirmation: 'secret', token: "abc")
    sign_in_as(user)
    assert_equal "abc", user.token
    
    delete logout_url, params: {id: user.id }
    assert_redirected_to root_path

    user.reload
    assert_nil user.token
  end

  
end
