require 'twitter'

ben = User.create(name: "Ben Brostoff", email: "ben.brostoff@gmail.com",
            handle: "bmb21", password: "test", password_confirmation: "test")
sid = User.create(name: "Sid Patel", email: "sidpatel13@gmail.com",
            handle: "sidpatel13", password: "test", password_confirmation: "test")
brendan = User.create(name: "Brendan Susens-Jackson", email: "bsusensjackson@gmail.com",
            handle: "brendansjackson", password: "test", password_confirmation: "test")
tanner = User.create(name: "Tanner Welsh", email: "tannerwelsh@gmail.com",
            handle: "tannerwelsh", password: "test", password_confirmation: "test")
armen = User.create(name: "Armen Vartan", email: "vartan.armen@gmail.com",
            handle: "armenvartan1", password: "test", password_confirmation: "test")

def tweet_creator(handle, id)
  holder = []
  $client.user_timeline(handle, :count => 300).each do |tweet|
    holder << tweet if !tweet.retweet? && !tweet.in_reply_to_screen_name?
  end
  holder.each {|tweet| Tweet.create(user_id: id, datetime: tweet.created_at, text: tweet.text) }
end

tweet_creator(ben.handle, ben.id)
tweet_creator(sid.handle, sid.id)
tweet_creator(tanner.handle, tanner.id)
tweet_creator(brendan.handle, brendan.id)
tweet_creator(armen.handle, armen.id)



# ben_tweets = []
# $client.user_timeline("bmb21", :count => 300).each do |tweet|
#   ben_tweets << tweet if !tweet.retweet? && !tweet.in_reply_to_screen_name?
# end

# sid_tweets = []
# $client.user_timeline("sidpatel13", :count => 300).each do |tweet|
#   sid_tweets << tweet if !tweet.retweet? && !tweet.in_reply_to_screen_name?
# end

# ben_tweets.each do |tweet|
#   Tweet.create(user_id: 1, datetime: tweet.created_at, text: tweet.text)
# end

# sid_tweets.each do |tweet|
#   Tweet.create(user_id: 2, datetime: tweet.created_at, text: tweet.text)
# end
