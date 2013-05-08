class CreateTrades < ActiveRecord::Migration
  def self.up
    create_table :trades do |t|
      t.integer :state
      t.integer :character1_id
      t.integer :character1_money
      t.integer :character2_id
      t.integer :character2_money
      #t.timestamps
    end
  end

  def self.down
    drop_table :trades
  end
end
