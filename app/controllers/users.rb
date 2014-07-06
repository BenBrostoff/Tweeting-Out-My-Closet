enable :sessions

get '/users/signup' do
  erb :signup
end

post '/users/new' do
  @user = User.create(name: params[:name], email: params[:email],
              password: params[:password],
              password_confirmation: params[:confirm_password],
              handle: params[:handle])
  if @user.save
    session[:user_id] = @user.id
    session[:message] = "An administrator will review your twitter handle and determine its validity :-)."
    redirect "/users/#{@user.id}"
  else
    @message = "You've entered invalid information!"
  end
end

post '/users/signin' do
  @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
  if @user
    session[:user_id] = @user.id
    redirect "/"
  else
    @invalid_login = true
    erb :login
  end
end

get '/users/:id' do #all your tweets and how many votes you have
  if current_user.id == params["id"].to_i
    @logged_in = true
  end
  @tweets = Tweet.where(user_id: params["id"].to_i).where.not(user_votes: 0).
            order("average_votes DESC").order("user_votes DESC").take(5)
  #only tweets that are users and have been voted on once

  @my_votes = Vote.where(user_id: params["id"]).order("current_votes DESC").take(5)
  @my_voted_tweets = []
  @my_votes.each do |vote|
    @my_voted_tweets << Tweet.find(vote.tweet_id)
  end
  @this_user = User.find(params["id"])
  erb :user_page
end

get '/users/change_password/:user_id' do #to change password
  erb :"change_password"
end

put '/users/change_password' do #submit password
  first = params["password_1"]
  second = params["password_2"]
  if first == second
    current_user.update(password: first)
    session[:message] = "Password successfully changed."
    redirect '/'
  end
  @messages = "Invalid password confirmation."
  erb :"change_password"
end

get '/signout' do#all your tweets and how many votes you have
  session.clear
  redirect "/"
end

