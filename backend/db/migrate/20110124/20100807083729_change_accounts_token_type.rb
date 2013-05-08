class ChangeAccountsTokenType < ActiveRecord::Migration
  def self.up
    change_column :accounts, :token, :string
  end

  def self.down
    change_column :accounts, :token, :integer
  end
end
