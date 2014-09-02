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

ActiveRecord::Schema.define(version: 20140902005346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hash_sizes", force: true do |t|
    t.integer  "size"
    t.integer  "hashtag_feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hash_sizes", ["hashtag_feed_id"], name: "index_hash_sizes_on_hashtag_feed_id", using: :btree

  create_table "hashtag_feeds", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "auto_categorized", default: false
  end

  add_index "hashtag_feeds", ["category_id"], name: "index_hashtag_feeds_on_category_id", using: :btree

  create_table "insta_users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "userid"
  end

  create_table "posts", force: true do |t|
    t.integer  "insta_user_id"
    t.integer  "hashtag_feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "instagram_id"
    t.json     "hashtags"
    t.integer  "created_time"
    t.json     "location"
  end

  add_index "posts", ["hashtag_feed_id"], name: "index_posts_on_hashtag_feed_id", using: :btree
  add_index "posts", ["insta_user_id"], name: "index_posts_on_insta_user_id", using: :btree

  create_table "related_hashtag_posts", force: true do |t|
    t.integer  "post_id"
    t.integer  "related_hashtag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "related_hashtag_posts", ["post_id"], name: "index_related_hashtag_posts_on_post_id", using: :btree
  add_index "related_hashtag_posts", ["related_hashtag_id"], name: "index_related_hashtag_posts_on_related_hashtag_id", using: :btree

  create_table "related_hashtags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_spam",    default: false
  end

  create_table "searches", force: true do |t|
    t.string   "topic"
    t.integer  "hashtag_feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "searches", ["hashtag_feed_id"], name: "index_searches_on_hashtag_feed_id", using: :btree

end
