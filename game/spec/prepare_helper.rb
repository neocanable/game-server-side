module PrepareHelper
  def fake_name
    (Time.now.strftime("%Y%m%d%H%M%S").to_i + rand(100000)).to_s
  end

  def truncate_table(name)
    ActiveRecord::Base.connection.execute("TRUNCATE `#{name}`")
  end

  def prepare_character
    truncate_table("accounts")
    truncate_table("characters")
    @account   = Account.create :name => fake_name, :user_id => 0
    @character = Character.create :name => fake_name, :appearance => 0, :profession => 0,:account_id => @account.id
  end

  def prepare_character2
    account   = Account.create :name => fake_name, :user_id => 0
    character = Character.create :name => fake_name, :appearance => 0, :profession => 0,:account_id => account.id
  end

end
