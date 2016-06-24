require 'colorizr'

class Tribe  
attr_reader  :name, :members

  def initialize(options = {})
  	@name = options[:name]
  	@members = options[:members]
  	puts "Tribe #{@name}".green + " has been successfully initiated."
  end

  def tribal_council(immune = {})
    @immune = immune[:immune]
    result = @members.select {|member| member != immune[:immune]}
    eliminated_contestant = result.sample
    puts "#{eliminated_contestant.to_s}".red + " is eliminated"
    eliminate(eliminated_contestant)
    eliminated_contestant
  end


  def eliminate(member)
    puts "#{member.name}".capitalize.yellow + " from tribe " + "#{self.name}".pink + " is " + "voted off".green + 
     " the survivr server!"
    @members.delete(member) if @members.include?(member)
  end


  def to_s
    @name 
  end 
end