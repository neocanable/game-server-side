class AddSenderToMail < ActiveRecord::Migration
  def self.up
    add_column :mails, :sender_id, :integer
  end

  def self.down
    remove_column :mails, :sender_id
  end
end
