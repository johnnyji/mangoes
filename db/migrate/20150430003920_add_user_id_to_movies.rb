class AddUserIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :user_id, :integer, references: :users
  end
end
