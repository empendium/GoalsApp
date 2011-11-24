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

ActiveRecord::Schema.define(:version => 20111104142248) do

  create_table "airports", :force => true do |t|
    t.string   "code"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", :force => true do |t|
    t.integer  "number"
    t.time     "departs_at"
    t.integer  "departure_airport_id"
    t.integer  "arrival_airport_id"
    t.integer  "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "meal",                 :default => false
  end

  create_table "reservations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "flight_id"
    t.date     "travels_on"
    t.string   "card_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
