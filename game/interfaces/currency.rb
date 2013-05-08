module Vici
  class CurrencyInterface < Interface
    class << self

      def character_consume_money(character, amount)
        character.spend_money!(amount)
        player_money(character.money, character.account_id)
      end

      def character_consume_diamond(character, amount)
        character.spend_diamond!(amount) 
        player_diamond(character.account.diamond, character.account_id)
      end

      def character_consume_voucher(character, amount)
        character.spend_voucher!(amount)
        player_voucher(character.voucher, character.account_id)
      end

      def character_consume_honor(character, amount)
        character.spend_honor!(amount)
        player_honor(character.honor, character.account_id)
      end

    end
  end
end  

