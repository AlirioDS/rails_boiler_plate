require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @role = Role.create!(name: 'user')
    @user = User.new(email: 'test@example.com', password: 'password123', role: @role)
  end

  test "should be valid with valid attributes" do
    assert @user.valid?
  end

  test "should not be valid without email" do
    @user.email = nil
    assert_not @user.valid?
  end

  test "should not be valid without role" do
    @user.role = nil
    assert_not @user.valid?
  end

  test "should belong to role" do
    assert_respond_to @user, :role
  end

  test "email should be unique" do
    @user.save
    duplicate_user = User.new(email: 'test@example.com', password: 'password123', role: @role)
    assert_not duplicate_user.valid?
  end
end
