# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100320095630) do

  create_table "features", :force => true do |t|
    t.integer  "tile_id",     :null => false
    t.string   "description", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "x",           :null => false
    t.integer  "y",           :null => false
    t.integer  "image_id",    :null => false
    t.string   "name"
  end

  create_table "images", :force => true do |t|
    t.string   "filename",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  create_table "maps", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.integer  "parent_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["user_id", "created_at"], :name => "index_messages_on_user_id_and_created_at"

  create_table "tiles", :force => true do |t|
    t.integer  "map_id"
    t.integer  "x",          :null => false
    t.integer  "y",          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_id",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token"
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.string   "twitter_name"
    t.string   "signup_source"
    t.string   "facebook_name"
    t.integer  "facebook_uid"
  end

  add_index "users", ["oauth_token"], :name => "index_users_on_oauth_token"

end
