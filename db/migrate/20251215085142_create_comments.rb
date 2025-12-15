class CreateComments < ActiveRecord::Migration[8.1]
  def change
    create_table :comments, id: false do |t|
      t.bigserial :id_comment, null:false, primary_key: true
      t.bigint :id_user, null: false
      t.bigint :id_post, null: false
      t.bigint :id_parent_comment, null: true
      t.string :comment, null: false, limit: 30 
      t.datetime :created_at, null: false 
      t.datetime :updated_at, null: false
    end
    add_foreign_key :comments, :users, column: :id_user, primary_key: :id_user
    add_foreign_key :comments, :posts, column: :id_post, primary_key: :id_post
    add_foreign_key :comments, :comments, column: :id_parent_comment, primary_key: :id_comment
    add_index :comments, :id_user
    add_index :comments, :id_post
    add_index :comments, :id_parent_comment
  end
end
