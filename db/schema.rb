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

ActiveRecord::Schema.define(version: 20150206031411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "time"
    t.boolean  "text_sent"
    t.string   "stylized_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "events_guests_joins", force: :cascade do |t|
    t.integer "event_id"
    t.integer "guest_id"
    t.boolean "declined_invitation", default: false
  end

  create_table "guests", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "venues", ["event_id"], name: "index_venues_on_event_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "guest_id"
    t.integer  "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["event_id"], name: "index_votes_on_event_id", using: :btree
  add_index "votes", ["guest_id"], name: "index_votes_on_guest_id", using: :btree
  add_index "votes", ["venue_id"], name: "index_votes_on_venue_id", using: :btree

  add_foreign_key "venues", "events"
  add_foreign_key "votes", "events"
  add_foreign_key "votes", "guests"
  add_foreign_key "votes", "venues"
end
