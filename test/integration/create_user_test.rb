require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest

  test "successfully sign up new user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: "roger", email: "roger@example.com", password: "password"}
    end
    assert_template 'users/show'
    assert_match "roger", response.body
  end
end
