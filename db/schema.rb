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

ActiveRecord::Schema.define(:version => 20121116122255) do

  create_table "accounts", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.integer  "score"
    t.decimal  "balance"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "actors", :force => true do |t|
    t.integer  "film_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "administrators", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "films", :force => true do |t|
    t.string   "title"
    t.string   "director"
    t.string   "country"
    t.integer  "length"
    t.date     "time"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "order_lines", :force => true do |t|
    t.integer  "order_id"
    t.integer  "ticket_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "account_id"
    t.datetime "time"
    t.decimal  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tickets", :force => true do |t|
    t.integer  "film_id"
    t.datetime "time"
    t.integer  "room"
    t.integer  "colume"
    t.integer  "row"
    t.decimal  "price"
    t.boolean  "onsale"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
