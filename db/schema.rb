# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_12_15_085142) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "comments", primary_key: "id_comment", force: :cascade do |t|
    t.string "comment", limit: 30, null: false
    t.datetime "created_at", null: false
    t.bigint "id_parent_comment"
    t.bigint "id_post", null: false
    t.bigint "id_user", null: false
    t.datetime "updated_at", null: false
    t.index ["id_parent_comment"], name: "index_comments_on_id_parent_comment"
    t.index ["id_post"], name: "index_comments_on_id_post"
    t.index ["id_user"], name: "index_comments_on_id_user"
  end

  create_table "posts", primary_key: "id_post", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "id_user", null: false
    t.string "post", limit: 50, null: false
    t.datetime "updated_at", null: false
    t.index ["id_user"], name: "index_posts_on_id_user"
  end

  create_table "users", primary_key: "id_user", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "login", limit: 20, null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_users_on_login", unique: true
  end

  add_foreign_key "comments", "comments", column: "id_parent_comment", primary_key: "id_comment"
  add_foreign_key "comments", "posts", column: "id_post", primary_key: "id_post"
  add_foreign_key "comments", "users", column: "id_user", primary_key: "id_user"
  add_foreign_key "posts", "users", column: "id_user", primary_key: "id_user"
end
