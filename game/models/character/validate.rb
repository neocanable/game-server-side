class Character < ActiveRecord::Base

  MAX_CHARACTERS_PER_ACCOUNT = 6

  validates_uniqueness_of :name, :message => :NAME_ALREADY_INUSE
  validates_length_of :name, :in => 1..14, :allow_nil => false, :message => :INVALID_NAME
  validates_presence_of :appearance, :message => :INVALID_APPEARANCE
  validates_presence_of :profession, :message => :INVALID_PROFESSION

  def validate_on_create
    if Character.count(:conditions => { :account_id => self.account_id }) >= MAX_CHARACTERS_PER_ACCOUNT
      errors.add(:account_id, :TOO_MANY_CHARACTERS)
    end
  end

end
