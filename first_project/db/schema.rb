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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140325200251) do

  create_table "pitchers", :force => true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "mlb_id"
    t.string   "first"
    t.string   "last"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pitchers_users", :id => false, :force => true do |t|
    t.integer "pitcher_id"
    t.integer "user_id"
  end

  create_table "pitches", :force => true do |t|
    t.integer  "pitcher_id"
    t.float    "mph"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "year",       :default => 2013
  end

  create_table "teams", :force => true do |t|
    t.integer  "users_id"
    t.string   "abbreviation"
    t.string   "city"
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "teams_users", :id => false, :force => true do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "screenname"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
