# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161012170505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admissions", force: :cascade do |t|
    t.string   "student_id"
    t.string   "gender"
    t.text     "street"
    t.string   "city"
    t.string   "mobile"
    t.string   "email"
    t.string   "id_number"
    t.string   "id_type"
    t.string   "admission_date"
    t.integer  "batch_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "admissions", ["batch_id"], name: "index_admissions_on_batch_id", using: :btree
  add_index "admissions", ["user_id"], name: "index_admissions_on_user_id", using: :btree

  create_table "batches", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string   "name"
    t.integer  "minimum_marks"
    t.integer  "maximum_marks"
    t.integer  "weightage"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "grading_levels", force: :cascade do |t|
    t.string   "name"
    t.integer  "minimum_marks"
    t.integer  "maximum_marks"
    t.string   "grade_point"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "telephone"
    t.string   "email"
    t.string   "city"
    t.string   "region"
    t.string   "currency_type"
    t.string   "logo"
    t.string   "country"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.string   "subject_type"
    t.integer  "batch_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "terms_semisters", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.date     "vacation_date"
    t.date     "reopening_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_type"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "admissions", "batches"
  add_foreign_key "admissions", "users"
end
