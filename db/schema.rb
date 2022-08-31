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

ActiveRecord::Schema[7.0].define(version: 2022_08_31_210103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "town"
    t.string "zipcode"
    t.string "state"
    t.integer "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "person_id", null: false
    t.index ["person_id"], name: "index_addresses_on_person_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "emailaddress"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "person_id", null: false
    t.index ["person_id"], name: "index_emails_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "firstName"
    t.string "middleName"
    t.string "lastName"
    t.string "ssn"
    t.date "birthDate"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "salutation", default: 0
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "phonenumber"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "person_id", null: false
    t.index ["person_id"], name: "index_phone_numbers_on_person_id"
  end

  add_foreign_key "addresses", "people"
  add_foreign_key "emails", "people"
  add_foreign_key "phone_numbers", "people"
end
