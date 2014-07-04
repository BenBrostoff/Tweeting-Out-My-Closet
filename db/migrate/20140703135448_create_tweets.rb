class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :user
      t.datetime :datetime
      t.text :text

      t.timestamps
    end
  end
end
