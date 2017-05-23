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

ActiveRecord::Schema.define(version: 20170523191915) do

  create_table "comments", force: :cascade do |t|
    t.text    "content"
    t.integer "message_id"
    t.integer "user_id"
    t.index ["message_id"], name: "index_comments_on_message_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["author_id", "receiver_id"], name: "index_conversations_on_author_id_and_receiver_id", unique: true
    t.index ["author_id"], name: "index_conversations_on_author_id", unique: true
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id", unique: true
  end

  create_table "eventrinfos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picurl"
    t.date     "date"
    t.string   "location"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.time     "time"
    t.string   "event_style"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "picurl2"
    t.string   "picurl3"
    t.string   "cover"
  end

  create_table "goings", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "event_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "event_id"
    t.text     "description"
    t.boolean  "private"
  end

  create_table "hostinfos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.integer  "capacity"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.boolean  "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_members_on_group_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_messages_on_group_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "personal_messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "author_id"
    t.integer  "receiver_id"
    t.index ["author_id"], name: "index_personal_messages_on_author_id"
    t.index ["conversation_id"], name: "index_personal_messages_on_conversation_id"
    t.index ["receiver_id"], name: "index_personal_messages_on_receiver_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "invite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_requests_on_group_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "liked_by"
    t.integer  "disliked_by"
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "avatar"
  end

end
