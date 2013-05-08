require File.expand_path(File.dirname(__FILE__) + "/../spec")
require File.expand_path(File.dirname(__FILE__) + "/prepare_helper")

describe Spell do
  include PrepareHelper

  before do 
    prepare_character
    truncate_table("spells")
  end

  it "should got default spell" do 
    spells = Spell.character_spells(@character.id)
    spells.size.should == 0

    Spell.create_character_default_spells(@character.id)
    spells = Spell.character_spells(@character.id)
    spells.size.should > 0
  end

  it "should learn spell faild if has 0 spell point" do 
    spell_id = 10000
    @character.unspent_points = 0
    @character.save

    lambda{Spell.learn(spell_id, @character.id)}.should raise_error(NotEnoughSpellPointsError)
  end

  it "should learn faild if character money == 0" do 
    @character.unspent_points = 1
    @character.money = 0
    @character.save
    static_spell = Vici.const_get(:SPELL).detect{|key, value| value["money"].to_i > 0 }.last
    spell_id = static_spell["spell_base_id"].to_i
    money = static_spell["money"].to_i
    lambda{Spell.learn(spell_id, @character.id)}.should raise_error(NotEnoughMoneyError)
  end

  it "should not learn if already reach max level" do 
    static_spell = Vici.const_get(:SPELL).detect{|key, value| value["money"].to_i > 0 }.last
    spell_id      = static_spell["spell_base_id"].to_i
    static_base_spell = Vici::Code.first(:SPELL_BASE, "id", spell_id)

    @character.unspent_points = 1
    @character.money = static_spell["money"].to_i + 2
    @character.save
    prepare_spell(@character.id, spell_id, static_base_spell["max_rank"].to_i)

    lambda{Spell.learn(spell_id, @character.id)}.should raise_error(MaxSpellLevelError)    
  end

  it "should not learn if level too low" do 
    static_spell      = Vici.const_get(:SPELL).detect{|key, value| value["money"].to_i > 0 }.last
    spell_id          = static_spell["spell_base_id"].to_i
    static_base_spell = Vici::Code.first(:SPELL_BASE, "id", spell_id)   
    @character.unspent_points = 1
    @character.money          = static_spell["money"].to_i
    @character.level          = static_spell["level_required"].to_i - 1
    @character.save

    lambda{Spell.learn(spell_id, @character.id)}.should raise_error(LevelTooLowError)
  end

  it "should learn new spell" do 
    static_spell      = Vici.const_get(:SPELL).detect{|key, value| value["money"].to_i > 0 }.last
    spell_id          = static_spell["spell_base_id"].to_i
    static_base_spell = Vici::Code.first(:SPELL_BASE, "id", spell_id)   
    @character.unspent_points = 22
    @character.money          = static_spell["money"].to_i*4
    @character.level          = static_spell["level_required"].to_i 
    @character.save

    spell = Spell.learn(spell_id, @character.id)
    spell.should_not be_nil
    spell.rank.should == 1

    spell = Spell.learn(spell_id, @character.id)
    spell.should_not be_nil
    spell.rank.should == 2
  end

  it "should gets character unspent_points" do 
    Spell.unspent_points(@character.id).should == @character.unspent_points
  end


  private

    def prepare_spell(character_id, spell_id, rank)
      Spell.create :spell_id => spell_id, :rank => rank, :character_id => character_id
    end
end
