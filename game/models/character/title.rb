class Character < ActiveRecord::Base
  def use_title(title)
    self.current_title = title.nil? ? nil : title.title_id
    save!
  end
end
