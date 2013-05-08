class Item < ActiveRecord::Base
  class << self

    def craft!(character, static_recipe, condiment)
      container = Container.player_container(Vici::ContainerType::BAG_MATERIAL, character.id)  
      raise NotEnoughMaterialError unless container.has_enough_material?(static_recipe)
      raise ContainerFullError unless container.has_free_slot?

      static_item_id = static_recipe['item_id']
      attributes = equipment_static_attributes(static_item_id)
      # 附加几次属性
      weight = [55, 36, 9]
      sections = Vici::Random.build_sections(weight)
      n = Vici::Random.roll_in_sections(sections)
      while (n > 0)
        plus_addtional_attributes(attributes, static_item_id)
        n -= 1
      end
      attributes.delete("attack")
      attributes.delete("spell_attack")
      item = create_equipment(character, static_item_id, attributes)
    end

    def create_equipment(character, static_item_id, additional_attributes = nil)
      static_equipment = Vici::Code.first(:EQUIPMENT, 'id', static_item_id)
      item_attributes = additional_attributes || {}
      item_attributes[:character_id] = character.id
      item_attributes[:static_item_id] = static_item_id
      item_attributes[:quantity] = 1
      item_attributes[:durability] = static_equipment['durability'] / 2
      item_attributes[:max_durability] = static_equipment['durability']
      create item_attributes
    end
    
    # 装备基础属性
    def equipment_static_attributes(static_equipment_id)
      static_equipment = Vici::Code.first(:EQUIPMENT, 'id', static_equipment_id)
      attributes = {}
      all_equip_addtional_attributes do |name, code|
        attributes[name] = static_equipment[name] ? static_equipment[name] : 0
      end
      attributes['durability'] = attributes['max_durability']
      # 装备的基础攻防 = 物理攻防
      if static_equipment['base_attack']
        attributes['min_attack'] += static_equipment['base_attack'] 
        attributes['max_attack'] += static_equipment['base_attack'] 
      end
      if static_equipment['base_defense']
        attributes['defense'] += static_equipment['base_defense']
      end
      attributes['expired'] = Time.now + static_equipment['expired'] if static_equipment['expired']
      attributes
    end
    
    # 装备的附加属性
    def plus_addtional_attributes(attributes, static_equipment_id)
      static_equipment = Vici::Code.first(:EQUIPMENT, 'id', static_equipment_id)
      static_item = Vici::Code.first(:ITEM, 'id', static_equipment_id)
      # 选择附加的属性
      attribute_code = equipment_addtional_attribute(static_equipment['equipment_type'])
      # 范围内随机取值
      amount = addition_value(attribute_code, static_item['level_required'])
      attribute_name = Vici::Code.code_name(attribute_code, :ItemMod).downcase
      # 向基础装备附加属性
      attributes[attribute_name] += amount if attributes[attribute_name]
      attributes
    end
    
    # 装备的全部附加属性
    def all_equip_addtional_attributes
      raise ArgumentError, "Missing block" unless block_given?
      Vici::ItemMod.constants.each do |const_name|
        code = Vici::ItemMod.const_get(const_name.to_sym)
        yield(const_name.downcase, code)
      end
    end
    
    # TODO，迁移到初始化，或者静态数据生成
    EQUIPMENT_TYPES = %w( weapon armor jewelry 
                        one_hand two_hand 
                        sharp blunt 
                        melee range spell 
                        light medium heavy 
                      ).freeze
    # 各属性出现的权重
    def equipment_type_weight(equipment_type)
      weight = Array.new(Vici::ItemMod.constants.size, 0)
      static_equipment_type = Vici::Code.first(:EQUIPMENT_TYPE, 'id', equipment_type)
      # 属于哪几个类型？
      types = EQUIPMENT_TYPES.select {|type| static_equipment_type[type] == 1 }
      # 计算各种属性权重
      all_equip_addtional_attributes do |name, code|
        w = Vici::Code.first(:EQUIPMENT_CRAFT_WEIGHT, 'mod', code)
        # 累加各个类型的权重
        types.each do |type_name|
          weight[code] += w[type_name] if w[type_name] and weight[code]
        end
      end
      weight
    end
    
    # 哪个附加属性？
    def equipment_addtional_attribute(equipment_type)
      weight = equipment_type_weight(equipment_type)
      sections = Vici::Random.build_sections(weight)
      Vici::Random.roll_in_sections(sections)
    end
    
    # 附加数值
    def addition_value(additional_attribute, level)
      # 取值范围
      ranges = Vici::Code.find(:EQUIPMENT_MOD_RANGE, 'mod', additional_attribute)
      range = ranges.select {|range| level >= range['level_low'] and level <= range['level_high']}.first
      Vici::Random.between(range['min'], range['max'])
    end

  end


  def drop_durability(point = 1)
    self.durability -= point
    self.durability = 0 if self.durability < 0
    save!
  end


end
