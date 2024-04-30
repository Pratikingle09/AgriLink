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

ActiveRecord::Schema[7.1].define(version: 2024_04_29_085139) do
  create_table "alerts", force: :cascade do |t|
    t.text "alert"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_alerts_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.text "answer_body"
    t.string "asked_by"
    t.integer "live_feed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["live_feed_id"], name: "index_answers_on_live_feed_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.string "question_title"
    t.text "question_body"
    t.integer "question_asked_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "live_feeds", force: :cascade do |t|
    t.string "title"
    t.text "question_body"
    t.integer "asked_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_live_feeds_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text "notification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "mobile"
    t.string "account_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alerts", "users"
  add_foreign_key "answers", "Live_Feeds", column: "live_feed_id"
  add_foreign_key "answers", "users"
  add_foreign_key "live_feeds", "users"
end
