class Mail < ActiveRecord::Base
  has_many :mail_attachments, :dependent => :destroy
  belongs_to :sender, :class_name => "Character", :foreign_key => "sender_id"

  def read!
    self.unread = 0
    save!
  end

  def receive_money!
    self.money = 0
    save!
  end
end
