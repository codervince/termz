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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121227080613) do

  create_table "approvals", :force => true do |t|
    t.string  "name"
    t.integer "ranking"
  end

  create_table "domains", :force => true do |t|
    t.string "name"
    t.string "code"
    t.string "image_url"
  end

  create_table "languages", :force => true do |t|
    t.string "name"
    t.string "iso_code"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "source_lang_id"
    t.string   "access_token"
    t.integer  "owner_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "sources", :force => true do |t|
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "translations", :force => true do |t|
    t.integer  "source_lang_id"
    t.string   "source_content"
    t.integer  "target_lang_id"
    t.string   "target_content"
    t.integer  "domain_id"
    t.integer  "owner_id"
    t.integer  "approval_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "project_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "guest"
    t.integer  "locale_id"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
