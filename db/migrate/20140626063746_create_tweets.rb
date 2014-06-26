class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.references :user
      t.boolean :public
      t.timestamps
    end
  end
end
