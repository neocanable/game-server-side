class AddAuthInfoToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :token, :integer
    add_column :accounts, :last_access, :integer
    add_column :accounts, :multi_login, :boolean
  end

  def self.down
    remove_column :accounts, :multi_login
    remove_column :accounts, :last_access
    remove_column :accounts, :token
  end
end
