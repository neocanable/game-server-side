class RenameAccountToAccountId < ActiveRecord::Migration
  def self.up
    rename_column(:characters, :account, :account_id)
  end

  def self.down
    rename_column(:characters, :account_id, :account)
  end
end
