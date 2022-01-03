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

ActiveRecord::Schema.define(version: 2022_01_01_103733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "ticket_id", null: false
    t.bigint "user_id", null: false
    t.integer "ticket_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ticket_id"], name: "index_carts_on_ticket_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "ticket_id", null: false
    t.bigint "user_id", null: false
    t.string "order_timestamp"
    t.string "slug"
    t.integer "sellign_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ticket_id"], name: "index_orders_on_ticket_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "plane_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "seat_no0", default: true
    t.boolean "seat_no1", default: true
    t.boolean "seat_no2", default: true
    t.boolean "seat_no3", default: true
    t.boolean "seat_no4", default: true
    t.boolean "seat_no5", default: true
    t.boolean "seat_no6", default: true
    t.boolean "seat_no7", default: true
    t.boolean "seat_no8", default: true
    t.boolean "seat_no9", default: true
    t.boolean "seat_no10", default: true
    t.boolean "seat_no11", default: true
    t.boolean "seat_no12", default: true
    t.boolean "seat_no13", default: true
    t.boolean "seat_no14", default: true
    t.boolean "seat_no15", default: true
    t.boolean "seat_no16", default: true
    t.boolean "seat_no17", default: true
    t.boolean "seat_no18", default: true
    t.boolean "seat_no19", default: true
    t.boolean "seat_no20", default: true
    t.boolean "seat_no21", default: true
    t.boolean "seat_no22", default: true
    t.boolean "seat_no23", default: true
    t.boolean "seat_no24", default: true
    t.boolean "seat_no25", default: true
    t.boolean "seat_no26", default: true
    t.boolean "seat_no27", default: true
    t.boolean "seat_no28", default: true
    t.boolean "seat_no29", default: true
    t.boolean "seat_no30", default: true
    t.boolean "seat_no31", default: true
    t.boolean "seat_no32", default: true
    t.boolean "seat_no33", default: true
    t.boolean "seat_no34", default: true
    t.boolean "seat_no35", default: true
    t.boolean "seat_no36", default: true
    t.boolean "seat_no37", default: true
    t.boolean "seat_no38", default: true
    t.boolean "seat_no39", default: true
    t.boolean "seat_no40", default: true
    t.boolean "seat_no41", default: true
    t.boolean "seat_no42", default: true
    t.boolean "seat_no43", default: true
    t.boolean "seat_no44", default: true
    t.boolean "seat_no45", default: true
    t.boolean "seat_no46", default: true
    t.boolean "seat_no47", default: true
    t.boolean "seat_no48", default: true
    t.boolean "seat_no49", default: true
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "ticket_amount"
    t.string "departure"
    t.string "arrival"
    t.string "seat_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ticket_serial"
    t.string "departure_date"
    t.string "ticket_type"
    t.string "returning_date"
    t.string "departure_time"
    t.string "arrival_time"
    t.string "return_departure_airport"
    t.string "return_arrival_airport"
    t.string "return_departure_time"
    t.string "return_arrival_time"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "tel"
    t.string "last_name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "tickets"
  add_foreign_key "carts", "users"
  add_foreign_key "orders", "tickets"
  add_foreign_key "orders", "users"
end
