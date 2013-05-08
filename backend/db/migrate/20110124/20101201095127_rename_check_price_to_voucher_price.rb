class RenameCheckPriceToVoucherPrice < ActiveRecord::Migration
  def self.up
    rename_column(:malls, :check_price, :voucher_price)
  end

  def self.down
    rename_column(:malls, :voucher_price, :check_price)
  end
end
