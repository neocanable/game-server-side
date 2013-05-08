class AddVoucherToCharacters < ActiveRecord::Migration
  def self.up
    add_column :characters, :voucher, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :characters, :voucher
  end
end
