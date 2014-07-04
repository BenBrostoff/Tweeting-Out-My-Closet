get '/' do #this should be a log-in screen
  erb :index
end

post '/users' do

end

get 'users/:id' do#all your tweets and how many votes you have

end

get '/play' do
  tweet_number = Tweet.all.size
  @tweet = Tweet.find(rand(tweet_number) + 1) #random tweet
  @author = User.find(@tweet.user_id)
  erb :game_page
end

post '/play/rate/:tweet_id' do  #change to /users/:id/play/rate #AJAX
  @tweet = Tweet.find(params[:tweet_id])
  #@tweet.update(current_votes: 0)
  @tweet.upvote(params[:votes].to_i)

  #Vote.create()
  erb :game_page
  #{}.to_json
end

post '/game/:tweet_id/votes/:vote_id' do #votes are created in this handler

end

post '/play/guess/:author_id' do
#ran into issues here - AJAX / json can't handle form submissions
#e.g. params[:choice] reads as null in json
#good question for Matt / Tanner
  author_id = params["author_id"].to_i
  correct_name = User.find(author_id).name
  choice = params["choice"].to_i
  if author_id == choice
    message = "Correct! You know your cohort well :-)"
  else
    message = "Wrong! I suppose you need to get more familiar with #{correct_name}"
  end
  "#{message}"
end

get '/play/guess/:user_id' do
  "TEST"
end




