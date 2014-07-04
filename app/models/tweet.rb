class Tweet < ActiveRecord::Base
  has_many :votes
  
  def upvote(votes)
    self.current_votes += votes
  end

end

