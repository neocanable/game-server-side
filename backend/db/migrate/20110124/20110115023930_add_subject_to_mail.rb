class AddSubjectToMail < ActiveRecord::Migration
  def self.up
    remove_column :mails, :title
    remove_column :mails, :attachment_item_id
    remove_column :mails, :quantity

    add_column :mails, :subject, :string
    add_column :mails, :content, :string
    add_column :mails, :money, :integer
    add_column :mails, :unread, :boolean
    add_column :mails, :created_at, :datetime
  end

  def self.down
    remove_column :mails, :subject
    remove_column :mails, :content
    remove_column :mails, :money
    remove_column :unread, :money
    remove_column :mails, :created_at

    add_column :mails, :title, :string
    add_column :mails, :attachment_item_id, :integer
    add_column :mails, :quantity, :integer
  end
end
