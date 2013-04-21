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

ActiveRecord::Schema.define(:version => 20130421075130) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "activities", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "imageurl"
    t.boolean  "neverexpired"
    t.date     "validfrom"
    t.date     "validto"
    t.integer  "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "type"
    t.integer  "point"
    t.integer  "factory_id"
  end

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "companies", ["email"], :name => "index_companies_on_email"
  add_index "companies", ["name"], :name => "index_companies_on_name"

  create_table "factories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "email"
    t.string   "code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "logo"
    t.string   "scanimgurl"
    t.integer  "company_id"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "user_id"
    t.integer  "status"
    t.string   "ship_address"
    t.date     "ship_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "line_items", ["activity_id"], :name => "index_line_items_on_activity_id"
  add_index "line_items", ["user_id"], :name => "index_line_items_on_user_id"

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "code"
    t.integer  "factory_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "point"
    t.string   "image"
    t.string   "image_path"
  end

  add_index "products", ["factory_id"], :name => "index_products_on_factory_id"

  create_table "users", :force => true do |t|
    t.string   "phone"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "credit"
  end

  create_table "variants", :force => true do |t|
    t.string   "fullcode"
    t.string   "password"
    t.integer  "factory_id"
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "retry_count"
    t.string   "ipaddress"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "checked"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  add_index "variants", ["factory_id"], :name => "index_variants_on_factory_id"
  add_index "variants", ["fullcode"], :name => "index_variants_on_fullcode"
  add_index "variants", ["product_id"], :name => "index_variants_on_product_id"
  add_index "variants", ["user_id"], :name => "index_variants_on_user_id"

end
