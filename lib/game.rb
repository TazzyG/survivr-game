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
		losing_tribe  = @tribes.sample
		losing_tribe
	end

	def clear_tribes
    @tribes = []
  end

  def merge(name)
  	members = @tribes.map(&:members).flatten
  	
  	Tribe.new(name: name, members: members)	
  end
 
  def individual_immunity_challenge
    immune = @tribes[0].members.sample
	  immune
	end
end