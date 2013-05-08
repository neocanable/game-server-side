class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :salt
      t.datetime :created_at
      t.datetime :last_login
    end
  end

  def self.down
    drop_table :accounts
  end
end
