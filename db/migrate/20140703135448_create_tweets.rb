class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      belongs_to :user
      t.datetime :datetime
      t.text :text
      t.integer :votes

      t.timestamps
    end
  end
end
