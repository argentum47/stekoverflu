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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150327080211) do

  create_table "answers", force: :cascade do |t|
    t.text     "content",     limit: 65535
    t.boolean  "accepted",    limit: 1,     default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "question_id", limit: 4
    t.integer  "score",       limit: 4,     default: 0
    t.integer  "user_id",     limit: 4,                     null: false
  end

  add_index "answers", ["question_id"], name: "fk_rails_3d5ed4418f", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.string   "content",          limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "post_id", limit: 4, null: false
    t.integer "tag_id",  limit: 4, null: false
  end

  add_index "posts_tags", ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer "points",  limit: 4, default: 2
    t.integer "user_id", limit: 4,             null: false
  end

  add_index "profiles", ["user_id"], name: "fk_rails_e424190865", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.integer  "stars",      limit: 4,     default: 0
    t.integer  "user_id",    limit: 4,                 null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "score",      limit: 4,     default: 0
  end

  add_index "questions", ["user_id"], name: "fk_rails_047ab75908", using: :btree

  create_table "questions_tags", id: false, force: :cascade do |t|
    t.integer "question_id", limit: 4, null: false
    t.integer "tag_id",      limit: 4, null: false
  end

  add_index "questions_tags", ["question_id", "tag_id"], name: "index_questions_tags_on_question_id_and_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.text     "name",        limit: 65535
    t.integer  "tags_count",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "description", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "nickname",   limit: 255,             null: false
    t.string   "email",      limit: 255,             null: false
    t.string   "provider",   limit: 255
    t.integer  "uid",        limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "avatar",     limit: 255
    t.integer  "points",     limit: 4,   default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["nickname"], name: "index_users_on_nickname", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer "voteable_id",   limit: 4
    t.string  "voteable_type", limit: 255
    t.integer "score",         limit: 4,   default: 0
    t.integer "user_id",       limit: 4
  end

  add_index "votes", ["user_id"], name: "fk_rails_c9b3bef597", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "profiles", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "votes", "users"
end
