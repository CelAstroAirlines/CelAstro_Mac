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

ActiveRecord::Schema.define(version: 2021_12_23_234951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.boolean "seat_no0"
    t.boolean "seat_no1"
    t.boolean "seat_no2"
    t.boolean "seat_no3"
    t.boolean "seat_no4"
    t.boolean "seat_no5"
    t.boolean "seat_no6"
    t.boolean "seat_no7"
    t.boolean "seat_no8"
    t.boolean "seat_no9"
    t.boolean "seat_no10"
    t.boolean "seat_no11"
    t.boolean "seat_no12"
    t.boolean "seat_no13"
    t.boolean "seat_no14"
    t.boolean "seat_no15"
    t.boolean "seat_no16"
    t.boolean "seat_no17"
    t.boolean "seat_no18"
    t.boolean "seat_no19"
    t.boolean "seat_no20"
    t.boolean "seat_no21"
    t.boolean "seat_no22"
    t.boolean "seat_no23"
    t.boolean "seat_no24"
    t.boolean "seat_no25"
    t.boolean "seat_no26"
    t.boolean "seat_no27"
    t.boolean "seat_no28"
    t.boolean "seat_no29"
    t.boolean "seat_no30"
    t.boolean "seat_no31"
    t.boolean "seat_no32"
    t.boolean "seat_no33"
    t.boolean "seat_no34"
    t.boolean "seat_no35"
    t.boolean "seat_no36"
    t.boolean "seat_no37"
    t.boolean "seat_no38"
    t.boolean "seat_no39"
    t.boolean "seat_no40"
    t.boolean "seat_no41"
    t.boolean "seat_no42"
    t.boolean "seat_no43"
    t.boolean "seat_no44"
    t.boolean "seat_no45"
    t.boolean "seat_no46"
    t.boolean "seat_no47"
    t.boolean "seat_no48"
    t.boolean "seat_no49"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "ticket_amount"
    t.string "departure"
    t.string "arrival"
    t.string "airport"
    t.datetime "date"
    t.string "seat_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ticket_id"
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
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "tickets"
  add_foreign_key "carts", "users"
  add_foreign_key "orders", "tickets"
  add_foreign_key "orders", "users"
end
