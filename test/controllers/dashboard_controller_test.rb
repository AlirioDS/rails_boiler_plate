require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  def setup
    @role = Role.create!(name: 'user')
    @user = User.create!(email: 'test@example.com', password: 'password123', role: @role)
  end

  test "should get index when authenticated" do
    sign_in @user
    get dashboard_url
    assert_response :success
  end

  test "should redirect to sign in when not authenticated" do
    get dashboard_url
    assert_redirected_to user_session_path
  end
end