enable :sessions

post '/users/signin' do
  @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
  if @user
    session[:user_id] = @user.id
    p session[:user_id]
    redirect "/"
  else
    @invalid_login = true
    erb :login
  end
end

get '/users/:id' do#all your tweets and how many votes you have
  @tweets = []
  @vote_array = []
  Vote.where(user_id: current_user.id).each do |vote|
    @vote_array << vote.current_votes #gives array of all votes
    @tweets << Tweet.find(vote.tweet_id) #only tweets that were voted on
  end
  @vote_array = @vote_array.sort.reverse #ordered vote array
  @tweets = @tweets.find_all{ |tweet| tweet.user_id == current_user.id }
  #only tweets that are mine and tweets that got votes
  erb :user_page
end

get '/signout' do#all your tweets and how many votes you have
  session.clear
  redirect "/"
end

