class Jury
	attr_accessor  :members

  def initialize
  	@members = []
  end
  
  def add_member(contestant)
  	@members.push(contestant)
  end

  def cast_votes(finalists)
  	votes = Hash.new
  	finalists.each {|finalist| votes[finalist] = 0}
  
  @members.each do |member|
    finalist = finalists.sample
    votes[finalist] += 1
    puts "#{member.to_s} voted for #{finalist.to_s}"
    end
  votes
  end

  def report_votes(votes)
    winner = votes.each {|finalist, votes|}[0]
    puts "#{finalist.to_s} has " + "#{total_votes}" + " votes." 
   
  end

  def announce_winner(votes)
      highest_votes = votes.values.max
      winner = votes.key(highest_votes)
      puts "#{winner} Wins Survivr"
      winner
  end

end