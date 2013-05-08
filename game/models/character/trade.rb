class Character < ActiveRecord::Base
  def latest_trade
    Trade.first(:conditions => ["character1_id=? OR character2_id=?", self.id ,self.id])
  end
end
