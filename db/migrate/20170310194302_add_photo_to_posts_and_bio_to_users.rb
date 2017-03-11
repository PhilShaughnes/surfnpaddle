class AddPhotoToPostsAndBioToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bio, :string
    add_column :posts, :summary, :string
    add_column :posts, :photo, :string
  end
end
