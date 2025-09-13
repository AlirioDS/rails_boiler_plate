require "application_system_test_case"

class UserAuthenticationTest < ApplicationSystemTestCase
  def setup
    @role = Role.create!(name: 'user')
    @user = User.create!(email: 'test@example.com', password: 'password123', role: @role)
  end

  test "user can sign in and access dashboard" do
    visit new_user_session_path

    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password123'
    click_button "Log in"

    assert_current_path dashboard_path
    assert_text @user.email
    assert_text @user.role.name
  end

  test "user cannot sign in with invalid credentials" do
    visit new_user_session_path

    fill_in "Email", with: @user.email
    fill_in "Password", with: 'wrongpassword'
    click_button "Log in"

    assert_current_path user_session_path
    assert_text "Invalid Email or password"
  end

  test "user can sign out" do
    sign_in @user
    visit dashboard_path

    click_button "logout"

    assert_current_path user_session_path
  end
end