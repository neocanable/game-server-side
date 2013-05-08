class Item < ActiveRecord::Base
  def lock!
    self.locked = true
    save!
  end

  def unlock!
    self.locked = false
    save!
  end
end
