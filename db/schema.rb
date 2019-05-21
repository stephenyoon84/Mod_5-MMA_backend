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

ActiveRecord::Schema.define(version: 20190514145121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_members", force: :cascade do |t|
    t.integer "group_id"
    t.string "member_type"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_type", "member_id"], name: "index_group_members_on_member_type_and_member_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.bigint "user_id"
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "phone_number"
    t.string "gender"
    t.date "dob"
    t.date "register_date"
    t.boolean "active", default: true
    t.text "info"
    t.boolean "welcome_mail", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "phone_number"
    t.string "gender"
    t.date "dob"
    t.date "register_date"
    t.boolean "active"
    t.text "info"
    t.string "user_type", default: "team"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "groups", "users"
end
