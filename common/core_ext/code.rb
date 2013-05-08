module Vici
  module Code
    def self.code_defined?(code, table)
      raise "code table undefined" unless table
      table = retrieve table
      (table.constants.map {|const| table.const_get(const.to_sym) }).include?(code)
    end

#    code_name = Vici::Code.code_name(code, table)
#    code_name.capitalize!
#    Code.code_name(SeedFoo::SAFETY_AREA, :SeedFoo).should == "SAFETY_AREA"
    def self.code_name(code, table)
      code_table = retrieve table
      code_table.constants.select {|name| code_table.const_get(name.to_sym) == code }.first
    end

#    public_zones = Code.find(:ZONE, 'type', ZoneType::SAFETY_AREA, ZoneType::WILD_AREA)
    def self.find(table, column, *args)
      table = retrieve table
      (table.select {|k,v| args.include?(v[column]) }).map {|v| v[1] }
    end

#    zone = Code.first(:ZONE, 'id', 1)
#    npc = Code.first(:NPC, 'id', npc_id)
    def self.first(table, column, *args)
      self.find(table, column, *args).first
    end

    def self.include?(table, id)
      table = retrieve table
      (table.find {|k,v| k == id }) != nil
    end


#   Vici::Code.find2(:PROFESSION_STATS, 'profession', 'level', Vici::CharacterProfession::NOVICE, 1)
#   Vici::Code.find2(:PROFESSION_STATS, 'profession', 'level', Vici::CharacterProfession::NOVICE, 2)
    # match 2 column
    def self.find2(table, c1, c2, v1, v2)
      table = retrieve table
      (table.select {|k,v| v[c1] == v1 && v[c2] == v2 }).map {|v| v[1] }.first
    end

    private
      def self.retrieve(table)
        Vici.const_get(table) if table.is_a? Symbol
      end
  end
end
