class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.string :user_id
      t.string :post_id

      t.timestamps
    end
  end
end
