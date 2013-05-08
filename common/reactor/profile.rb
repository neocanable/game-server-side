class ProfileSample
  attr_reader :name    
  attr_reader :instances  
  attr_reader :open   
  attr_reader :start_time   
  attr_reader :children_sample_time  
  attr_reader :num_parents  
	attr_reader :accumulator

  def initialize(name, start_time)
    @name = name
    @open = true
    @instances = 1
    @start_time = start_time
    @accumulator = 0
    @children_sample_time = 0
  end

  def open(start_time)
    raise if is_open?
    @open = true
    @instances += 1
    @start_time = start_time
  end

  def close(elapsed_time, num_parents)
    raise unless is_open?
    @accumulator += elapsed_time
    #puts "#{name} closed, #{elapsed_time}, #{@accumulator}"
    @num_parents = num_parents
    @open = false
  end

  def is_open?
    @open
  end

  def plus_children_sample_time(elapsed_time)
    @children_sample_time += elapsed_time
  end
end



class ProfileSampleHistory
  attr_reader :name   
  attr_reader :ave    
  attr_reader :min    
	attr_reader :max
  def initialize(name, percent_time)
    @count = 1
    @name, @ave, @min, @max = name, percent_time, percent_time, percent_time
  end

  def store(percent_time)
    @count += 1
    new_ratio = 1.0 / @count
    new_ratio = 1.0 if new_ratio > 1.0
    old_ratio = 1.0 - new_ratio
    @ave = @ave * old_ratio + percent_time * new_ratio
    @min = percent_time if percent_time < @min
    @max = percent_time if percent_time > @max
  end
end


class Profiler
  include Singleton  

  def initialize
    @samples = []
    @history = []

    profile_init
  end

  def profile_init
    @start_time = get_time
  end

  def profile_begin(name)
    sample = sample(name)
    start_time = get_time
    if sample
      sample.open(start_time)
    else
      @samples << ProfileSample.new(name, start_time)
    end
  end

  def profile_end(name)
    sample = sample(name)
    return unless sample
    elapsed_time = get_time - sample.start_time
    num_parents = 0
    parent = nil
    @samples.each do |s|
      next if s.name == name
      if s.is_open?
        num_parents += 1
        if parent.nil?
          parent = s
        elsif parent.start_time <= s.start_time
          parent = s
        end
      end
    end
    if parent
      parent.plus_children_sample_time(elapsed_time)
    end
    sample.close(elapsed_time, num_parents)
    profile_report(sample.name) if sample.instances == 3
  end

  def profile_report(name = nil)
    @end_time = get_time
    output = "\n ave  |  min  |  max  |   # | name"
    puts output
    samples = @samples.select{|sample| sample.name == name }
    samples.each do |s|
      raise if s.is_open?
      sample_time = s.accumulator - s.children_sample_time
      percent_time = (sample_time / (@end_time - @start_time)) * 100.0
      #puts "#{s.name} - #{s.accumulator}, #{s.children_sample_time} - #{sample_time} - #{percent_time}"
      history = store(s.name, percent_time)
      ave = "%3.1f" % history.ave
      min = "%3.1f" % history.min
      max = "%3.1f" % history.max
      instances = "%3d" % s.instances
      indent_name = "  " * s.num_parents + s.name
      output = "%5s | %5s | %5s | %3s | %s" % [ave, min, max, instances, indent_name]
      puts output
      @samples.delete(s)
      #clear  # 清空
    end
  end

  private
    def sample(name)
      @samples.find {|s| s.name == name }
    end

    def history(name)
      @history.find {|h| h.name == name }
    end

    def get_time
      Time.now.to_f
    end

    def store(name, percent_time)
      history = history(name)
      if history
        history.store(percent_time)
      else
        history = ProfileSampleHistory.new(name, percent_time)
        @history << history
      end
      history
    end
end









#@profiler = Profiler.new
#
#@n = 0
#def exit_game?
#  @n += 1
#  @n > 10 ? true : false
#end
#
#def read_input
#  sleep 0.05
#end
#
#def update_game_logic
#  sleep 0.05
#end
#
#def render_scene
#	sleep 0.05
#end
#
#def main
#  @profiler.profile_init
#  while not exit_game?
#    @profiler.profile_begin("main loop")
#    read_input
#		sleep 1
#    @profiler.profile_end("main loop")
#    @profiler.profile_report
#  end
#end
#
#main
