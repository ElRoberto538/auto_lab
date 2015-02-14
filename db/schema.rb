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

ActiveRecord::Schema.define(version: 20150214030633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "lab_requests", force: true do |t|
    t.string   "request_file"
    t.integer  "user_id"
    t.string   "name"
    t.hstore   "tests"
    t.integer  "shedule_id"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lab_requests", ["shedule_id"], name: "index_lab_requests_on_shedule_id", using: :btree
  add_index "lab_requests", ["user_id"], name: "index_lab_requests_on_user_id", using: :btree

  create_table "lab_types", force: true do |t|
    t.string   "name"
    t.integer  "lab_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lab_types", ["lab_request_id"], name: "index_lab_types_on_lab_request_id", using: :btree

  create_table "shedules", force: true do |t|
    t.datetime "due_date"
    t.integer  "user_id"
    t.text     "notes"
    t.integer  "max_recurrences"
    t.integer  "lab_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shedules", ["lab_type_id"], name: "index_shedules_on_lab_type_id", using: :btree
  add_index "shedules", ["user_id"], name: "index_shedules_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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
    t.string   "identifier"
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
