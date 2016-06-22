require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require 'colorizr'

def print_header(message)
	puts "~".light_blue * 80
	puts message.center(80).green
	puts "~".light_blue * 80
end 

print_header("Welcome to Survivr!")

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# # Create two new tribes with names -
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# # Create a new game of Survivr
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
	#Intro

		@borneo.tribes.each do |tribe|
		puts "Welcome #{tribe}".black
		end

print_header("For Phase 1, you will now compete in 8 challenges for immunity. Good luck!")




	eliminations = []
	8.times do
		immunity_challenge_losing_tribe = @borneo.immunity_challenge
		member_voted_off = immunity_challenge_losing_tribe.tribal_council
		immunity_challenge_losing_tribe.eliminate(member_voted_off)
		eliminations << member_voted_off
	end
	eliminations.count
end

def phase_two

	print_header("You have made it to Phase 2 and have 3 challenges to win immunity ")
	
eliminations = []
  3.times do
  	individual_immunity_winner = @borneo.individual_immunity_challenge
  	voted_off_member = @merge_tribe.tribal_council(individual_immunity_winner)
  	@merge_tribe.eliminate(voted_off_member)
  	eliminations << voted_off_member
  end
  eliminations.count
end

def phase_three

	print_header ("Well done. You made it to Phase 3 - where you will face the Jury!... mwahahaha")
	

	# In phase three, there are 7 more challenges with an “immune” winner, as in the previous rounds.
	eliminations = []
	7.times do 
		winner_of_individual_immunity = @borneo.individual_immunity_challenge
		voted_off_member = @merge_tribe.tribal_council(winner_of_individual_immunity)
		@merge_tribe.eliminate(voted_off_member)
		@jury.add_member(voted_off_member)
		eliminations << voted_off_member	
	end	
	eliminations.count
end

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================

phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members

print_header (" Nice Work everyone. Here we will learn who the big winner is!")

finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes

print_header ("Congratulations")
@jury.announce_winner(vote_results) #Jury announces final winner


print_header ("Thanks for Playing Survivr")