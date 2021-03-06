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

ActiveRecord::Schema.define(version: 20170912134605) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",                         null: false
    t.text     "body",                          null: false
    t.text     "content"
    t.string   "status",      default: "draft"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "category_id"
    t.integer  "user_id"
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "breeding_records", force: :cascade do |t|
    t.string   "feed"
    t.integer  "weight"
    t.integer  "height"
    t.boolean  "is_shed"
    t.text     "note"
    t.string   "photo_url"
    t.date     "date",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_breeding_records_on_date", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "deletable",  default: true
  end

  create_table "photos", force: :cascade do |t|
    t.string   "name",       null: false
    t.binary   "data",       null: false
    t.string   "file_type",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string   "title"
    t.string   "memo"
    t.date     "end_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "user_images", force: :cascade do |t|
    t.integer  "user_id"
    t.binary   "image"
    t.string   "file_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_images_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                            null: false
    t.text     "detail"
    t.text     "place"
    t.string   "email"
    t.string   "hashed_password",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "profile"
    t.string   "nick_name",                       null: false
    t.boolean  "administrator",   default: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

end
