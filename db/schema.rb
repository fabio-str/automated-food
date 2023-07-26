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

ActiveRecord::Schema[7.0].define(version: 2023_07_26_120649) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "street"
    t.string "postcode"
    t.string "delivery_time"
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_addresses_on_users_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.string "ingredients"
    t.string "url"
    t.bigint "restaurants_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurants_id"], name: "index_dishes_on_restaurants_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_rating"
    t.string "user_feedback"
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_orders_on_users_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "monday_open"
    t.string "monday_close"
    t.string "tuesday_open"
    t.string "tuesday_close"
    t.string "wednesday_open"
    t.string "wednesday_close"
    t.string "thursday_open"
    t.string "thursday_close"
    t.string "friday_open"
    t.string "friday_close"
    t.string "saturday_open"
    t.string "saturday_close"
    t.string "sunday_open"
    t.string "sunday_close"
    t.string "rating"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "stripe_customer_id"
    t.boolean "paying_customer", default: false
    t.string "stripe_subscription_id"
    t.string "sex"
    t.integer "age"
    t.integer "height"
    t.float "weight"
    t.string "activity_level"
    t.string "health_goal"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users", column: "users_id"
  add_foreign_key "dishes", "restaurants", column: "restaurants_id"
  add_foreign_key "orders", "users", column: "users_id"
end
