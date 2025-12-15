class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts, id: false do |t|
      t.bigserial  :id_post, null:false, primary_key: true
      t.bigint :id_user, null: false
      t.string :post, null: false, limit: 50 
      t.timestamps null: false
    end
    add_foreign_key :posts, :users, column: :id_user, primary_key: :id_user
    add_index :posts, :id_user
  end
end 