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

ActiveRecord::Schema.define(version: 2019_10_29_085011) do

  create_table "books", force: :cascade do |t|
    t.string "ISBN", null: false
    t.string "name", null: false
    t.string "author", null: false
    t.string "publisher", null: false
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "created_at"], name: "index_books_on_owner_id_and_created_at"
    t.index ["owner_id"], name: "index_books_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

end
