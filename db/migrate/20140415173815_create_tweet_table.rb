class CreateTweetTable < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :tweet
      t.belongs_to :user
      t.timestamps
    end
  end
end
