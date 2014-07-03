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
  erb :game_page

end

post '/game/:tweet_id/votes/:vote_id' do #votes are created in this handler

end



