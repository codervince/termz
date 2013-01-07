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

ActiveRecord::Schema.define(:version => 20130107173647) do

  create_table "approvals", :force => true do |t|
    t.string  "name"
    t.integer "ranking"
  end

  create_table "authorities", :force => true do |t|
    t.integer  "translation_id"
    t.integer  "source_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "domains", :force => true do |t|
    t.string "name"
    t.string "code"
    t.string "image_url"
    t.string "ancestry"
  end

  add_index "domains", ["ancestry"], :name => "index_domains_on_ancestry"

  create_table "languages", :force => true do |t|
    t.string "name"
    t.string "iso_code"
    t.string "image_url"
    t.string "local_name"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "source_lang_id"
    t.string   "access_token"
    t.integer  "user_id"
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
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "project_id"
    t.boolean  "is_public",      :default => true
    t.boolean  "is_term",        :default => true
    t.integer  "source_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "set_language_id"
    t.string   "name"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
