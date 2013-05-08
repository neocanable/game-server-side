class Drop 
  class << self
    # 物品掉落
    def items_drop(npc_id, character) 
      npc = static_npc(npc_id)
      items = Vici::Code.find(:ITEM_DROP,'npc_id',npc_id)
      arr = [npc['type1'],npc['type2'],npc['type3'],npc['type4']]
      items += find_with_multi_value(:ITEM_DROP, 'npc_type', arr)
      items = select_items_with_level(items, character.level)
      return [] if items.size == 0  # 找不到符合的返回空数组
  
      rand_drop_items(items)
    end
  
    # 查找一个column的值在一个数组范围内,根据arr的类型判别
    # arr里面可能存在nil，所以需要去掉里面所有的nil元素
    def find_with_multi_value(name, column, arr)
      case arr
        when Array
          table = Vici.const_get(name)
          table.select{|k,v| arr.compact.include?(v[column]) }.map{|v| v[1] }
        else
          Vici::Code.find(name,column,arr)
      end
    end
  
    # 选择等级与自己等级匹配的
    def select_items_with_level(items, level) 
      items.select{|v| v['min_level'].to_i <= level && v['max_level'].to_i >= level }
    end
  
    # 随机选择掉落的物品
    def rand_drop_items(items)
      items.collect{|item|
        num = rand(item['denominator'])
        if num < item['numerator']
          # 判断最大掉落的个数，如果是1,那么直接掉落，否则要随机计算一次
          item['max_drop'] == 1 ? item['item_id'] : [item['item_id']]*rand_range(1,item['max_drop'])
        else
          nil
        end
      }.flatten.compact
    end
  
  
    # 转换成叠加的物品，类似[1,2,3,4,1,4] => [[1,2],[2,1],[3,1],[4,1],[4,1]]
    # 物品1可以叠加,后面标志有两个1，但是物品4是不能叠加的
    def to_stack_items(items)
      results = []

      single_items = items.select{|e| 
        tmp_item = static_item(e)
        tmp_item["max_stack"] == 1
      }
      stack_items  = items - single_items
      tmp_hash     = {}
      single_items.each do |single_item_id|
        results << [single_item_id, 1]
      end
      stack_items.uniq.each{|temp_id| tmp_hash[temp_id] = 0  }
      stack_items.each do |stack_item_id|
        tmp_hash[stack_item_id] += 1
      end
      results += tmp_hash.collect{|k,v| [k,v] }
    end
  end
end
