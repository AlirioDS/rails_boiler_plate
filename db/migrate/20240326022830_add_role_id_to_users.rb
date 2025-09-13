class AddRoleIdToUsers < ActiveRecord::Migration[7.1]
  def up
    add_reference :users, :role, foreign_key: true
  end

  def down
    remove_foreign_key :users, :roles
    remove_reference :users, :role
  end
end
