class Tribe
attr_reader  :name, :members

  def initialize(options = {})
  	@name = options[:name]
  	@members = options[:members]
  	puts "Tribe #{@name} has been successfully initiated"
  end
  def tribal_council
  	@members.shuffle!
  	voted_off = @members[0]
  	@members.delete(voted_off)
  	puts "#{voted_off} is voted off"
  end
  # def format_members
  #   member_list = ""
  #   @members.each.with_index do |member, index|
  #       member_list = member_list +  member.to_s_with_color
  #       if member != @members.last
  #           member_list +=  ", "
  #       end
  #   end
  #   member_list
  # end
  def to_s
    @name
  end 
end