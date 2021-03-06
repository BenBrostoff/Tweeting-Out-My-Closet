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
adrian = User.create(name: "Adrian Soghoian", email: "adriansoghoian@gmail.com",
            handle: "soghoian", password: "test", password_confirmation: "test")
drew = User.create(name: "Drew Teter", email: "mteter13@gmail.com",
            handle: "MDrewT", password: "test", password_confirmation: "test")
kim = User.create(name: "Kim Cohen", email: "kimcohen@gmail.com",
            handle: "pinecohen", password: "test", password_confirmation: "test")
matt = User.create(name: "Matt Bunday", email: "mkbunday@gmail.com",
            handle: "zencephalon", password: "test", password_confirmation: "test")
antonio = User.create(name: "Antonio Perez", email: "rantoniops@gmail.com",
            handle: "rantoniops", password: "test", password_confirmation: "test")
ian = User.create(name: "Ian Shuff", email: "ianvshuff@gmail.com",
            handle: "shuff_bob_bomb", password: "test", password_confirmation: "test")
richard = User.create(name: "Richard Macias", email: "rjny86@gmail.com",
            handle: "RJNY86", password: "test", password_confirmation: "test")
greg = User.create(name: "Greg Knudsen", email: "greg.knudsen09@gmail.com",
                   handle: "Greg99799", password: "test", password_confirmation: "test")

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
tweet_creator(adrian.handle, adrian.id)
tweet_creator(drew.handle, drew.id)
tweet_creator(kim.handle, kim.id)
tweet_creator(matt.handle, matt.id)
tweet_creator(antonio.handle, antonio.id)
tweet_creator(ian.handle, ian.id)
tweet_creator(richard.handle, richard.id)
tweet_creator(greg.handle, greg.id)



