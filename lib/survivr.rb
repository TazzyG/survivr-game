require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require_relative "game"

#After your tests pass, uncomment this code below
#=========================================================
# - Phase One: Pre-Merge -
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
# - The game starts with 20 contestants. broken up evenly into two tribes of 10 contestants. -
@contestants.length # should be 20
# - Mix the contestants so they are not in a specific order -
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# - Create two new tribes with names -
# -  20 contestants, broken up evenly into two tribes of 10 contestants. -
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
## Extra Test for good luck and to make sure we didn't accidentally leave someone out. 
@contestants ## Should return => []

# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================
@borneo.tribes.each do |tribe|
puts "Welcome #{tribe}"
end
puts "Let the game begin!"
#This is where you will write your code for the three phases
def phase_one
	## The tribes compete in 8 challenges against each other in an immunity challenge. 
	## There is a losing tribe every time.
	## One contestant from the losing tribe is eliminated after every challenge at what is called a “Tribal Council”
	8.times do |i|	
		i = 0
		tribe_who_lost = @borneo.losing_tribe
		puts "#{tribe_who_lost}," + " I am afraid you have lost immunity challenge #{(i + 1)}" + " my friends"
		member_out = tribe_who_lost.losing_tribe
		i += 1
	end
end
puts "You will now compete in 8 challenges for immunity. Good luck!"
phase_one
	## At the end of phase one, there are a total of 12 remaining contestants.

#Phase Two:Merge
def merge_tribes
@contestants.push(@coyopa.members).flatten!
@contestants.push(@hunapu.members).flatten!
end
merge_tribes
@contestants.count # should be 12

puts "Welcome Survivr Contestants - You have made it to Phase 2"
# -  This is when they merge together into a single new tribe. - 

def phase_two
	# - The single tribe of 12 contestants compete in 3 additional individual immunity challenges.
	# - The individual winner of every challenge is immune from being eliminated.(immunity)
	
  3.times do
    eliminated_member = @borneo.immunity
    # elimination_report(eliminated_member)
    # tribe_report(@borneo.tribes[0])e
  end
end
phase_two
def phase_three
	print_header("PHASE THREE")
  eliminations = 0
  7.times do |i|
    eliminated_member = @borneo.individual_immunity_challenge
    @jury.add_member(eliminated_member)
    elimination_report(eliminated_member)
    puts "#{eliminated_member} is the #{(i + 1).ordinalize.light_blue} jury member."
    tribe_report(@borneo.tribes[0])
    eliminations += 1
  end
  eliminations
end

# Shared Methods 

def print_header(phase)
  length = phase.length
  puts "*".red * length
  puts phase.red
  puts "*".red * length
end

def elimination_report(eliminated_member)
  puts "#{eliminated_member} has been voted off the island."
end

def tribe_report(tribe)
  puts "The remaining members of " + "Tribe #{tribe}".green +  " are:\n\n"
  puts tribe.members
  puts ""
end

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
# phase_one #8 eliminations
# @merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
# phase_two #3 more eliminations
# @jury = Jury.new
# phase_three #7 elminiations become jury members
# finalists = @merge_tribe.members #set finalists
# vote_results = @jury.cast_votes(finalists) #Jury members report votes
# @jury.report_votes(vote_results) #Jury announces their votes
# @jury.announce_winner(vote_results) #Jury announces final winner
