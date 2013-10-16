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

ActiveRecord::Schema.define(version: 20131015142531) do

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "punch_times", force: true do |t|
    t.datetime "in"
    t.datetime "out"
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "organization_id"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_punch_time"
    t.string   "description"
    t.decimal  "latitude",         precision: 10, scale: 6
    t.decimal  "longitude",        precision: 10, scale: 6
  end

  add_index "punch_times", ["organization_id"], name: "index_punch_times_on_organization_id", using: :btree
  add_index "punch_times", ["project_id"], name: "index_punch_times_on_project_id", using: :btree
  add_index "punch_times", ["tag"], name: "index_punch_times_on_tag", using: :btree
  add_index "punch_times", ["user_id"], name: "index_punch_times_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_zone_pref"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  create_table "users_organizations", force: true do |t|
    t.integer "user_id"
    t.integer "organization_id"
  end

  create_table "users_projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
