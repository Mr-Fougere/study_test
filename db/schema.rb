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

ActiveRecord::Schema[7.0].define(version: 2022_07_14_081524) do
  create_table "questions", charset: "utf8mb4", force: :cascade do |t|
    t.text "question"
    t.text "answer1"
    t.text "answer2"
    t.text "answer3"
    t.text "answer4"
    t.integer "goodAnswer"
    t.string "themes"
    t.string "category"
  end

  create_table "quizzes", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "difficulty"
    t.bigint "question1_id"
    t.bigint "question2_id"
    t.bigint "question3_id"
    t.bigint "question4_id"
    t.bigint "question5_id"
    t.string "tempQuestion"
    t.index ["question1_id"], name: "fk_rails_d85fcd3290"
    t.index ["question2_id"], name: "fk_rails_d9788cfc05"
    t.index ["question3_id"], name: "fk_rails_8f8c4ac946"
    t.index ["question4_id"], name: "fk_rails_3104f6a20e"
    t.index ["question5_id"], name: "fk_rails_09eddb98ec"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "role", default: "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "quizzes", "questions", column: "question1_id"
  add_foreign_key "quizzes", "questions", column: "question2_id"
  add_foreign_key "quizzes", "questions", column: "question3_id"
  add_foreign_key "quizzes", "questions", column: "question4_id"
  add_foreign_key "quizzes", "questions", column: "question5_id"
end
