class Contestant
	attr_reader :name

  def initialize(name, immunity)
  	@name = name
  	@immunity = false
  end

  def to_s
  	@name
  end


end