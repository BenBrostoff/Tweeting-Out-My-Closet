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

post '/play/guess/:user_id' do
  right = User.find(params[:user_id]).name
  if params[:choice] == params[:user_id]
    @message = "Correct! You know your cohort well :-)"
  else
    @message = "Wrong! I suppose you need to get more familiar with #{right}"
  end
  {message: @message}.to_json
end




