class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users, id: false do |t|
      t.bigserial  :id_user, null:false, primary_key: true
      t.string :login, null: false, limit: 20
      t.timestamps null: false
    end
    add_index :users, :login, unique: true
  end
end