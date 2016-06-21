class Tribe
attr_reader  :name, :members

  def initialize(options = {})
  	@name = options[:name]
  	@members = options[:members]
  	puts "Tribe #{@name} has been successfully initiated"
  end
  def tribal_council(options = {})
  	@members.shuffle!
    elimation_pool = @members
    if options[:immune]
      elimination_pool.delete_if { |member| member == immune}
    end
  	voted_off = elimation_pool.sample 
  	@members.delete(voted_off) 
  	puts "#{voted_off} is voted off"
  end
  def to_s
    @name
  end 
end