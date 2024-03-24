class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :parent_tweet_id
      t.timestamps
    end
  end
end
