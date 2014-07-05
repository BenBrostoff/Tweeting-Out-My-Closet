get '/play' do #initiate game
  tweet_number = Tweet.all.size
  @tweet = Tweet.find(rand(tweet_number) + 1) #random tweet
  @author = User.find(@tweet.user_id)
  @has_voted = ""
  # if Vote.where(user_id: current_user.id, tweet_id: params["tweet_id"]) == 1
  #   @has_voted = "You already voted for this tweet! (#{}"
  # end
  erb :game_page
end

post '/play/vote/:tweet_id' do #votes are created / updated in this handler
  vote_count = params["current_votes"]
  vote = Vote.where(user_id: current_user.id, tweet_id: params["tweet_id"]).first_or_create
  vote.update(current_votes: vote_count)

  #multiple vote problem - we need to resolve
  tweet_id = params["tweet_id"].to_i
  tweet = Tweet.find(tweet_id)
  tweet.update(user_votes: tweet.user_votes + 1)
  tweet.update(total_votes: tweet.total_votes + params["current_votes"].to_i)
  tweet.update(average_votes: tweet.total_votes / tweet.user_votes)

  "On the embarrassment scale, you rated this tweet a #{vote_count} out of 100!"
end

post '/play/guess/:author_id' do #guesses are handled
  author_id = params["author_id"].to_i
  correct_name = User.find(author_id).name
  choice = params["choice"].to_i
  if author_id == choice
    message = "Correct! You know your cohort well :-)"
    color = "#00FF00"
    current_user.update(score: current_user.score += 1)
  else
    message = "Wrong! I suppose you need to get more familiar with #{correct_name}!"
    color = "#F08080"
    current_user.update(score: current_user.score -= 1)
  end
  {message: "#{message}", color: color}.to_json
end

