class Tribe
attr_reader  :name, :members

  def initialize(options = {})
  	@name = options[:name]
  	@members = options[:members]
  	puts "Tribe #{@name} has been successfully initiated"
  end

  def tribal_council(immune_member = nil) 
    unsafe_contestants = Array.new(@members)
    unsafe_contestants.delete(immune_member) if immune_member && unsafe_contestants.include?(immune_member)
    voted_off = unsafe_contestants.sample
  end

  def eliminate(member)
    puts "#{member.name} from tribe #{self.name} has now been voted off the survivr server!"
    @members.delete(member) if @members.include?(member)
  end
  def to_s
    @name 
  end 
end