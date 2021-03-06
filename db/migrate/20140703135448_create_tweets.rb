class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :user
      t.datetime :datetime
      t.text :text
      t.integer :total_votes, default: 0 #embarrassment ratings
      t.integer :user_votes, default: 0 #just users
      t.integer :average_votes, default: 0

      t.timestamps
    end
  end
end
