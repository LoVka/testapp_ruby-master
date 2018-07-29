# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_16_125817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position"], name: "index_categories_on_position", unique: true
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "editorial_lists", force: :cascade do |t|
    t.string "title", null: false
    t.text "about"
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_editorial_lists_on_slug", unique: true
  end

  create_table "editorial_lists_posts", force: :cascade do |t|
    t.bigint "editorial_list_id", null: false
    t.bigint "post_id", null: false
    t.index ["editorial_list_id"], name: "index_editorial_lists_posts_on_editorial_list_id"
    t.index ["post_id"], name: "index_editorial_lists_posts_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "user_id"
    t.string "title", null: false
    t.text "body", null: false
    t.text "lead", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "role", default: "User", null: false
    t.string "address", null: false
    t.integer "age", null: false
    t.boolean "approved", default: false, null: false
    t.boolean "banned", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "editorial_lists_posts", "editorial_lists", on_delete: :cascade
  add_foreign_key "editorial_lists_posts", "posts", on_delete: :cascade
  add_foreign_key "posts", "categories", on_delete: :cascade
  add_foreign_key "posts", "users", on_delete: :nullify
end
