class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image_url
      t.integer :user_id
      t.string :answer
      t.string :guess
      t.boolean :solution, default: false

      t.timestamps null: false
    end
  end
end
