get '/' do #this should be a log-in screen
  @tweets = []
  Vote.all.each do |vote|
    @tweets << Tweet.find(vote.tweet_id) #only tweets that were voted on
  end
  erb :index
end

get '/login' do
  erb :login
end




