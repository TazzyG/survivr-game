require 'colorizr'

class Tribe  
attr_reader  :name, :members

  def initialize(options = {})
  	@name = options[:name]
  	@members = options[:members]
  	puts "Tribe #{@name}".green + " has been successfully initiated."
  end

  # def test_tribal_council_immune_is_not_voted_off
  #   immune = @coyopa.members.first
  #   immune_array = Array.new(9, immune)
  #   9.times do
  #     result = @coyopa.tribal_council(immune: immune)
  #     p result
  #     if  result.class == Contestant && result != immune
  #       immune_array.pop
  #     end
  #   end
  #   refute_includes immune_array, immune
  # end


  def tribal_council(immune = "")
    not_immune = @members.select {|member| member != immune}
    voted_off = not_immune.sample
  end

  def eliminate(member)
    puts "#{member.name}".capitalize.yellow + " from tribe " + "#{self.name}".black + " is " + "voted off".green + 
     " the survivr server!"
    @members.delete(member) if @members.include?(member)
  end

  def to_s
    @name 
  end 
end