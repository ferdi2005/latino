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

ActiveRecord::Schema.define(version: 2021_03_25_213759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: :cascade do |t|
    t.integer "question_type"
    t.string "options", array: true
    t.integer "correct_options", array: true
    t.string "correct_texts", array: true
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "points"
    t.bigint "quiz_id", null: false
    t.index ["correct_options"], name: "index_questions_on_correct_options", using: :gin
    t.index ["correct_texts"], name: "index_questions_on_correct_texts", using: :gin
    t.index ["options"], name: "index_questions_on_options", using: :gin
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
  end

  create_table "studies", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.string "video"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "user_id", null: false
    t.integer "index_value"
    t.string "text_value"
    t.boolean "correct"
    t.float "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_quiz_id", null: false
    t.index ["question_id"], name: "index_user_answers_on_question_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
    t.index ["user_quiz_id"], name: "index_user_answers_on_user_quiz_id"
  end

  create_table "user_quizzes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "quiz_id", null: false
    t.datetime "end"
    t.float "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "ended", default: false
    t.boolean "surrender", default: false
    t.index ["quiz_id"], name: "index_user_quizzes_on_quiz_id"
    t.index ["user_id"], name: "index_user_quizzes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.float "points", default: 0.0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "questions", "quizzes"
  add_foreign_key "user_answers", "questions"
  add_foreign_key "user_answers", "user_quizzes"
  add_foreign_key "user_answers", "users"
  add_foreign_key "user_quizzes", "quizzes"
  add_foreign_key "user_quizzes", "users"
end
