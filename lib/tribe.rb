class Tribe
attr_reader  :name, :members

  def initialize(options = {})
  	@name = options[:name]
  	@members = options[:members]
  	puts "Tribe #{@name} has been successfully initiated"
  end
  def tribal_council(options = {})
  	@members.shuffle!
    @elimation_pool = members.delete[@immune]
    @elimination_pool.shuffle!
  	voted_off = @elimation_pool[0] 
  	@members.delete(voted_off) 
  	puts "#{voted_off} is voted off"
  end

  def to_s
    @name
  end 
end