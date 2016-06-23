require 'colorizr'

class Jury
	attr_accessor  :members

  def initialize
    @members = []
  end
  
  def add_member(member)
  	@members.push(member)
    puts "And now " + "#{member}".capitalize.yellow + " is now added to the jury."
  end

  def cast_votes(finalists)
  	votes = {}
    finalists.each {|finalist| votes[finalist] = 0}
    @members.each do |member|
      choice = finalists.sample
      votes[choice] += 1
      puts "#{member} ".capitalize.yellow +  "voted for " + "#{choice}.".capitalize.red 
      end
    votes
  end
  def report_votes(vote_results)
    vote_results.each do |finalist, vote_count|
      puts "#{finalist.name} ".capitalize.yellow + " received " +"#{vote_count.to_s}".light_blue + " vote(s)."
    end
  end

  def announce_winner(vote_results)
      winner = vote_results.max_by {|finalist, vote_results| vote_results}.first
      puts "                " +  "#{winner.name  }".capitalize.red + " wins" + "  s  ".upcase.red + "  u  ".upcase.green + "  r  ".upcase.blue + "  v  ".upcase.pink + "  i  ".upcase.light_blue + "  v  ".upcase.light_grey + "  r  ".upcase.black 
      winner
  end

end