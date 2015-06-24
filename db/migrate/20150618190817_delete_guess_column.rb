class DeleteGuessColumn < ActiveRecord::Migration
  def change
    remove_column(:posts, :guess)
  end

end
