require "test_helper"

class Users::SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @role = Role.create!(name: 'user')
    @user = User.create!(email: 'test@example.com', password: 'password123', role: @role)
  end

  test "should get new" do
    get new_user_session_url
    assert_response :success
  end

  test "should create session with valid credentials" do
    post user_session_url, params: { user: { email: @user.email, password: 'password123' } }
    assert_redirected_to dashboard_path
  end

  test "should not create session with invalid credentials" do
    post user_session_url, params: { user: { email: @user.email, password: 'wrong' } }
    assert_redirected_to user_session_path
  end

  test "should destroy session" do
    sign_in @user
    delete destroy_user_session_url
    assert_redirected_to user_session_path
  end
end