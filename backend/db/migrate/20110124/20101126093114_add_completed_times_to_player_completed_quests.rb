class AddCompletedTimesToPlayerCompletedQuests < ActiveRecord::Migration
  def self.up
    add_column :player_completed_quests, :completed_times, :integer
  end

  def self.down
    remove_column :player_completed_quests, :completed_times
  end
end
