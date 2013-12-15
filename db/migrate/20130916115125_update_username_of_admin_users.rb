class UpdateUsernameOfAdminUsers < ActiveRecord::Migration
  def up
    add_column :admin_users, :username, :string
    execute <<-SQL
      UPDATE admin_users SET username = email WHERE username IS NULL
    SQL
  end
end
