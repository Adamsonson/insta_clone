class AddUserisToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :user_id, :string
  end
end
