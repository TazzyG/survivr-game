class Game
	attr_reader :tribes

	def initialize(tribe1, tribe2)
		@tribes = [tribe1, tribe2]
	end

	def add_tribe(tribe)
		@tribes.push(tribe)
	end

	def immunity_challenge
		@tribes.sample
	end

	def clear_tribes
    @tribes = []
  end

  def merge(tribe_name)
  	merged_tribe = Tribe.new({name: name, members: merge_tribe_members})
    clear_tribes
    add_tribe(merged_tribe)
    merged_tribe
  end
  def individual_immunity_challenge
      immune = @tribes[0].members.sample
	    puts "#{immune}"+ " is safe from elimination."
	    @tribes[0].tribal_council(immune: immune)
  end

  def merge_tribe_members
  	@tribes.map(&:members).flatten
  end
end