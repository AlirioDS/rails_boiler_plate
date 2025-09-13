require "test_helper"

class RoleTest < ActiveSupport::TestCase
  def setup
    @role = Role.new(name: 'admin')
  end

  test "should be valid with valid attributes" do
    assert @role.valid?
  end

  test "should not be valid without name" do
    @role.name = nil
    assert_not @role.valid?
  end

  test "name should be unique" do
    @role.save
    duplicate_role = Role.new(name: 'admin')
    assert_not duplicate_role.valid?
  end

  test "should have many users" do
    assert_respond_to @role, :users
  end
end
