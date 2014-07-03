require 'twitter'

User.create(name: "Ben Brostoff", email: "ben.brostoff@gmail.com",
            handle: "bmb21", password: "test", password_confirmation: "test")
User.create(name: "Sid Patel", email: "sidpatel13@gmail.com",
            handle: "sidpatel13", password: "test", password_confirmation: "test")

ben_tweets = []
$client.user_timeline("bmb21", :count => 300).each do |tweet|
  ben_tweets << tweet if !tweet.retweet? && !tweet.in_reply_to_screen_name?
end

sid_tweets = []
$client.user_timeline("sidpatel13", :count => 300).each do |tweet|
  sid_tweets << tweet if !tweet.retweet? && !tweet.in_reply_to_screen_name?
end

ben_tweets.each do |tweet|
  Tweet.create(user_id: 1, datetime: tweet.created_at, text: tweet.text)
end

sid_tweets.each do |tweet|
  Tweet.create(user_id: 2, datetime: tweet.created_at, text: tweet.text)
end
