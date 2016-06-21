class Game
	attr_reader :tribes

	def initialize(tribe1, tribe2)
		@tribes = [tribe1, tribe2]
	end

	def add_tribe(tribe)
		@tribes.push(tribe)
	end

	def losing_tribe
		@tribes.sample
	end

	def clear_tribes
    @tribes = []
  end

  def immunity
  		@tribes.shuffle!
      @immune = @tribes[0].members.sample
	    puts "#{@immune}"+ " is safe from elimination."
	    # @@tribes[0].tribal_council(immune: immune)
  end
end