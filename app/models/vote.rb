class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet
  # Remember to create a migration!
end
