get '/' do #this should be a log-in screen
  @tweets = Tweet.all.order("average_votes DESC").take(5)
  erb :index
end

get '/login' do
  erb :login
end




