class CreateMails < ActiveRecord::Migration
  def self.up
    create_table :mails do |t|
      t.string :title                 # 邮件标题
      t.integer :character_id         # 角色
      t.integer :attachment_item_id   # 附件物品
      t.integer :quantity             # 数量
#      t.timestamps
    end
  end

  def self.down
    drop_table :mails
  end
end
