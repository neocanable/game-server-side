module Vici
  class MailInterface < Interface
    class << self

      def inbox(character, page)
        mails, pages = Mail.paginate(page, Vici::MAILS_PER_PAGE, "character_id=#{character.id}")
        mail_list_event(character, mails, page, pages)
      end
    
      def receive_mail(character, mail_id)
        mail = character.mails.find_by_id(mail_id)
        raise MailNotFoundError unless mail
        mail.read!
        mail_event(character, mail)
      end

      def receive_money(character, mail_id)
        mail = character.mails.find_by_id(mail_id)
        raise MailNotFoundError unless mail
        Character.transaction do 
          character.earn_money!(mail.money)
          mail.receive_money!
        end
        player_money(character.money, character.account_id)
        mail_event(character, mail)
      end

      def receive_attachment(character, mail_id, mail_attachment_id)
        mail = character.mails.find_by_id(mail_id)
        raise MailNotFoundError unless mail    
        attachment = mail.mail_attachments.find_by_id(mail_attachment_id)
        raise "MailAccachmentNotFoundError" unless attachment
        
        character_gets_items_event(attachment.item_id, attachment.quantity, character) 
        attachment.destroy
        mail_event(character, mail)
      end

      def destroy_mail(character, mail_id)
        mail = character.mails.find_by_id(mail_id)
        raise MailNotFoundError unless mail

        mail.destroy
        mail_deleted(mail_id, character.account_id)
      end

      def read_mail(character, mail_id)
        mail = character.mails.find_by_id(mail_id)
        raise MailNotFoundError unless mail

        mail.read!
        mail_event(character, mail)
      end

      def send_mail(sender, target_character_name, subject, body, money, attachments)
        target_character = Character.find_by_name(target_character_name)
        raise CharacterNotFoundError unless target_character
        raise NotEnoughMoneyError unless sender.has_enough_money?(money + Vici::MAIL_COST)
        mail = Mail.create :character_id => target_character.id, :sender_id => sender.id, :content => body, :subject => subject, :unread => false, :money => money
        attachments.each do |attachment|
          MailAttachment.create :mail_id => mail.id, :item_id => attachment.item_id, :quantity => attachment.quantity
          container_index = Item.bag_index_for_item(attachment.item_id)
          container = Container.player_container(container_index, sender.id)
          take_away_stacking_items_event(sender, attachment.item_id, attachment.quantity)
        end
        raise NotEnoughMoneyError unless sender.has_enough_money?(money)
        sender.spend_money!(money + MAIL_COST)
        character_gain_money_event(sender, 0)
        mail_send_success(sender.account_id)
        update_pending_mail(target_character.account_id)
      end
        
    end
  end
end  
