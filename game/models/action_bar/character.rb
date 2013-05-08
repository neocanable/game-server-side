class ActionBar < ActiveRecord::Base

  def self.create_character_default_action_bars(character_id)
    place(character_id, 0, 10000, nil)
#    ActionBar.place(character_id, 1, 31000, nil)
#    ActionBar.place(character_id, 2, 31100, nil)
#    ActionBar.place(character_id, 3, 31400, nil)
#    ActionBar.place(character_id, 4, 30800, nil)
#    ActionBar.place(character_id, 5, 30900, nil)
  end

end
