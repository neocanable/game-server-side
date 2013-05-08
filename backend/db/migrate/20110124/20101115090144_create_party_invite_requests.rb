class CreatePartyInviteRequests < ActiveRecord::Migration
  def self.up
    create_table :party_invite_requests do |t|
      t.integer :leader_id
      t.integer :target_id
      t.integer :elapsed
#      t.timestamps
    end
  end

  def self.down
    drop_table :party_invite_requests
  end
end
