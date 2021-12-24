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
    t.boolean "seatNo0"
    t.boolean "seatNo1"
    t.boolean "seatNo2"
    t.boolean "seatNo3"
    t.boolean "seatNo4"
    t.boolean "seatNo5"
    t.boolean "seatNo6"
    t.boolean "seatNo7"
    t.boolean "seatNo8"
    t.boolean "seatNo9"
    t.boolean "seatNo10"
    t.boolean "seatNo11"
    t.boolean "seatNo12"
    t.boolean "seatNo13"
    t.boolean "seatNo14"
    t.boolean "seatNo15"
    t.boolean "seatNo16"
    t.boolean "seatNo17"
    t.boolean "seatNo18"
    t.boolean "seatNo19"
    t.boolean "seatNo20"
    t.boolean "seatNo21"
    t.boolean "seatNo22"
    t.boolean "seatNo23"
    t.boolean "seatNo24"
    t.boolean "seatNo25"
    t.boolean "seatNo26"
    t.boolean "seatNo27"
    t.boolean "seatNo28"
    t.boolean "seatNo29"
    t.boolean "seatNo30"
    t.boolean "seatNo31"
    t.boolean "seatNo32"
    t.boolean "seatNo33"
    t.boolean "seatNo34"
    t.boolean "seatNo35"
    t.boolean "seatNo36"
    t.boolean "seatNo37"
    t.boolean "seatNo38"
    t.boolean "seatNo39"
    t.boolean "seatNo40"
    t.boolean "seatNo41"
    t.boolean "seatNo42"
    t.boolean "seatNo43"
    t.boolean "seatNo44"
    t.boolean "seatNo45"
    t.boolean "seatNo46"
    t.boolean "seatNo47"
    t.boolean "seatNo48"
    t.boolean "seatNo49"
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
