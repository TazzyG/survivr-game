require 'colorizr'

class Game
	attr_reader :tribes

	def initialize(*tribes)
		@tribes = ([] << tribes).flatten
	end

	def add_tribe(tribe)
		@tribes.push(tribe) unless @tribes.include?(tribe)
	end

	def immunity_challenge
		losing_tribe = @tribes.sample
		puts "#{losing_tribe}".black + " has lost the immunity challenge and must now vote out 1 member."
		losing_tribe
	end

	def clear_tribes
    @tribes = []
  end

  def merge(name)
  	members = []
	  @tribes.each { |tribe| members += tribe.members }
  	Tribe.new({name: name, members: members})
  end
 
  def individual_immunity_challenge	
    immune = @tribes[0].members.sample
	  puts "#{immune}".capitalize.yellow + ", you are safe from elimination :)"
	  immune
	end
end