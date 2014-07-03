class Tweet < ActiveRecord::Base
  has_many :votes
  # Remember to create a migration!
end
