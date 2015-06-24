class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :guess
      t.integer :points
      t.integer :post_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
