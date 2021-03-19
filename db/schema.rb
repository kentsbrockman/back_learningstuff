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

ActiveRecord::Schema.define(version: 2021_03_18_160913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "allowlisted_jwts", force: :cascade do |t|
    t.string "jti", null: false
    t.string "aud"
    t.datetime "exp", null: false
    t.bigint "user_id", null: false
    t.index ["jti"], name: "index_allowlisted_jwts_on_jti", unique: true
    t.index ["user_id"], name: "index_allowlisted_jwts_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.text "content"
    t.boolean "is_correct", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_learning_paths", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "learning_path_id", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.integer "position"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_chapters_on_course_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_comments_on_lesson_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses_learning_paths", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "learning_path_id", null: false
  end

  create_table "learning_paths", force: :cascade do |t|
    t.string "title"
    t.integer "price_in_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "chapter_id", null: false
    t.integer "position"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "content"
    t.string "video_url"
    t.index ["chapter_id"], name: "index_lessons_on_chapter_id"
  end

  create_table "one_time_payments", force: :cascade do |t|
    t.bigint "subscription_id", null: false
    t.integer "total_amount", null: false
    t.string "product_stripe_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subscription_id"], name: "index_one_time_payments_on_subscription_id"
  end

  create_table "progress_lessons", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.bigint "progress_state_id", null: false
    t.string "quizz_result"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_progress_lessons_on_lesson_id"
    t.index ["progress_state_id"], name: "index_progress_lessons_on_progress_state_id"
  end

  create_table "progress_states", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "subscription_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_progress_states_on_course_id"
    t.index ["subscription_id"], name: "index_progress_states_on_subscription_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.integer "position"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "explanation"
    t.index ["lesson_id"], name: "index_questions_on_lesson_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "learning_path_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["learning_path_id"], name: "index_subscriptions_on_learning_path_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.boolean "is_approved", default: false
    t.boolean "is_reviewed", default: false
    t.string "role", default: "student"
    t.text "description"
    t.string "linkedin_address"
    t.string "job"
    t.string "customer_stripe_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "allowlisted_jwts", "users", on_delete: :cascade
  add_foreign_key "answers", "questions"
  add_foreign_key "chapters", "courses"
  add_foreign_key "comments", "lessons"
  add_foreign_key "comments", "users"
  add_foreign_key "lessons", "chapters"
  add_foreign_key "one_time_payments", "subscriptions"
  add_foreign_key "progress_lessons", "lessons"
  add_foreign_key "progress_lessons", "progress_states"
  add_foreign_key "progress_states", "courses"
  add_foreign_key "progress_states", "subscriptions"
  add_foreign_key "questions", "lessons"
  add_foreign_key "subscriptions", "learning_paths"
  add_foreign_key "subscriptions", "users"
end
