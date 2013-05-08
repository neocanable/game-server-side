module Vici
  module Math
#    def self.random(n)
#    end


    def self.win?(bound, max = 100)
      rand(max) < bound
    end
  end



  class Random
    class << self
      # 根据各个区间的权重，生成各个区间的取值范围（上限）
      # build_sections([1,2,3]) => [1,3,6]
      def build_sections(sections_weight)
        sections = []
        a = sections_weight.dup
        until a.empty?
          sections << a.inject {|sum, w| sum + w }
          a.pop
        end
        sections.reverse
      end

      # 在整个区间内取得一个随机区间
      def roll_in_sections(sections)
        max = sections.last
        seed = rand(max)
        sections.each_with_index do |section_upper, index| 
          return index if seed < section_upper
        end
      end

      def between(min, max)
        min + rand(max - min + 1)
      end
    end
  end

=begin
weight = [2, 4, 4]
sections = Vici::Random.build_sections(weight)
result = []
(1..100000).each {|i| result << Vici::Random.roll_in_sections(sections) }
p result.select {|i| i == 0}.size
p result.select {|i| i == 1}.size
p result.select {|i| i == 2}.size
=end
end



