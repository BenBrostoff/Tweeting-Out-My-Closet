class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :tweet
      t.integer :current_votes, default: 0

      t.timestamps
    end
  end
end
