class Jury
	attr_accessor  :members

  def initialize
    @members = []
  end
  
  def add_member(member)
  	@members.push(member)
    puts "#{member}" + "is now added to the jury"
  end

  def cast_votes(finalists)
  	votes = {}
    finalists.each {|finalist| votes[finalist] = 0}
    @members.each do |member|
      choice = finalists.sample
      votes[choice] += 1
      puts "#{member.name} voted for #{choice}"
      end
    votes
  end
  def report_votes(vote_results)
    vote_results.each do |finalist, vote_count|
      puts "#{finalist.name} received #{vote_count} vote(s)."
    end
  end

  def announce_winner(vote_results)
      winner = vote_results.max_by {|finalist, vote_results| vote_results}.first
      puts "#{winner.name} wins survivr!! Yeah!!!!!!!!"
      winner
  end

end