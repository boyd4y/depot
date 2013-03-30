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

ActiveRecord::Schema.define(:version => 20130330070733) do

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
  end

  create_table "factories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "email"
    t.string   "code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "logo"
    t.string   "scanimgurl"
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

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "code"
    t.integer  "factory_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "point"
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
  end

  add_index "variants", ["factory_id"], :name => "index_variants_on_factory_id"
  add_index "variants", ["fullcode"], :name => "index_variants_on_fullcode"
  add_index "variants", ["product_id"], :name => "index_variants_on_product_id"
  add_index "variants", ["user_id"], :name => "index_variants_on_user_id"

end
