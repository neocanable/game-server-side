class CreateMailAttachments < ActiveRecord::Migration
  def self.up
    create_table :mail_attachments do |t|
      t.integer :mail_id
      t.integer :item_id
      t.integer :quantity
#      t.timestamps
    end
  end

  def self.down
    drop_table :mail_attachments
  end
end
