enable :sessions

post '/users/signin' do
  @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
  if @user
    session[:user_id] = @user.id
    p session[:user_id]
    redirect "/users/#{@user.id}"
  else
    @invalid_login = true
    erb :index
  end
end

get '/users/:id' do#all your tweets and how many votes you have
  erb :user_page
end

get '/signout' do#all your tweets and how many votes you have
  session.clear
  redirect "/"
end

