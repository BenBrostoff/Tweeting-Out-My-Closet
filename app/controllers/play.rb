get '/play' do #initiate game
  tweet_number = Tweet.all.size
  @tweet = Tweet.find(rand(tweet_number) + 1) #random tweet
  @author = User.find(@tweet.user_id)
  erb :game_page
end

post '/play/vote/:tweet_id' do #votes are created / updated in this handler
  vote_count = params["current_votes"]
  vote = Vote.create(user_id: current_user.id, tweet_id: params["tweet_id"])
  vote.update(current_votes: vote_count)
  "On the embarrassment scale, you rated this tweet a #{vote_count} out of 100!"
end

post '/play/guess/:author_id' do #guesses are handled
  author_id = params["author_id"].to_i
  correct_name = User.find(author_id).name
  choice = params["choice"].to_i
  if author_id == choice
    message = "Correct! You know your cohort well :-)"
    color = "#00FF00"
  else
    message = "Wrong! I suppose you need to get more familiar with #{correct_name}!"
    color = "#F08080"
  end
  {message: "#{message}", color: color}.to_json
end

