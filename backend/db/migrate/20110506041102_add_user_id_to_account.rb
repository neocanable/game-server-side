class AddUserIdToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :user_id, :string, :null => false
  end

  def self.down
    remove_column :accounts, :user_id
  end
end
