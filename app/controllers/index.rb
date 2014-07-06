get '/' do #this should be a log-in screen
  @tweets = Tweet.all.order("average_votes DESC").where.not(average_votes: 0).order("user_votes DESC").take(5)
  @high_scores = User.all.where.not(score: 0).order("score DESC").take(5)
  erb :index
end

get '/login' do
  erb :login
end




