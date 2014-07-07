get '/' do #this should be a log-in screen
  @tweets = Tweet.all.order("average_votes DESC").where.not(average_votes: 0).order("user_votes DESC").take(5)
  @high_scores = User.all.where.not(score: 0).order("score DESC").take(5)
  erb :index
end

get '/login' do
  erb :login
end

post '/search' do
  search_term = params[:search]
  @tweets = Tweet.where("text like?", "%#{search_term}%").order("average_votes DESC").order("user_votes DESC")
  @message = "Returning everything in the closet that includes #{search_term}"
  erb :search
end


