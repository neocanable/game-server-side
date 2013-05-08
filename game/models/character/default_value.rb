class Character < ActiveRecord::Base
  before_create :default_money
  before_create :default_level
  before_create :default_location
  before_create :default_status
  #before_create :default_craft

  # TODO 修要修改
  after_create :default_container
  after_create :default_action_bar
  after_create :default_spell
  after_create :create_default_mail
  after_create :create_default_title

  class << self
    def birthplace
      location = Vici::LOCATION.find do |k,v|
        v["type"] == Vici::LocationType::BIRTHPLACE
      end
      raise "birthplace undefined" if location.nil?
      location[1]
    end
  end

  def in_same_scene?(character)  
    self.scene_id == character.scene_id
  end

  def unit_id
    (1..(8 - self.id.to_s.size)).collect{"0"}.join.concat(self.id.to_s)
  end

  private

    def default_money
      self.money = 0
      self.voucher = 0
      self.honor = 0
    end
  
    def default_level
      self.level = 1
      self.xp = 0
      self.unspent_points = 100
    end
  
    def default_location
      brithplace = Character.birthplace
      self.static_zone_id = brithplace["zone"]
      self.x = brithplace["x"]
      self.y = brithplace["y"]
    end
  
    def default_status
      self.health  = 1000000
      self.power   = 1000000
      self.is_dead = false
  
      self.online = Vici::Online::OFFLINE
      self.logout_time = nil
    end

#    def default_craft
#      self.craft = nil
#      self.craft_points = 0
#    end

    def default_container
      Container.create_character_default_containers(self.id)
    end

    def default_action_bar
      ActionBar.create_character_default_action_bars(self.id)
    end

    def default_spell
      Spell.create_character_default_spells(self.id)
    end

    def create_default_mail
      mail = Mail.create :character_id => self.id, :sender_id => self.id, :subject => "测试", :content => "这里是测试邮件", :unread => true, :money => 0
      MailAttachment.create :mail_id => mail.id, :item_id => 70, :quantity => 2
      MailAttachment.create :mail_id => mail.id, :item_id => 70, :quantity => 2
      MailAttachment.create :mail_id => mail.id, :item_id => 70, :quantity => 2
    end

    def create_default_title
      (1..6).each do |i|
        Title.create :title_id => i, :character_id => self.id
      end
    end

end
