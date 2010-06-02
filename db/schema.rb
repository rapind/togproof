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

ActiveRecord::Schema.define(:version => 20100424151009) do

  create_table "bookings", :force => true do |t|
    t.integer  "client_id",                  :null => false
    t.string   "title",       :limit => 128, :null => false
    t.date     "occurs_on"
    t.date     "expires_on"
    t.integer  "price"
    t.boolean  "ready"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.integer  "photographer_id",                                   :null => false
    t.string   "name",                :limit => 64
    t.string   "email",               :limit => 100,                :null => false
    t.string   "crypted_password",                                  :null => false
    t.string   "password_salt",                                     :null => false
    t.string   "persistence_token",                                 :null => false
    t.string   "single_access_token",                               :null => false
    t.string   "perishable_token",                                  :null => false
    t.integer  "login_count",                        :default => 0, :null => false
    t.integer  "failed_login_count",                 :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip",    :limit => 11
    t.string   "last_login_ip",       :limit => 11
    t.string   "street_1",            :limit => 128
    t.string   "street_2",            :limit => 100
    t.string   "city",                :limit => 64
    t.string   "postal_code",         :limit => 20
    t.string   "country",             :limit => 32
    t.string   "province",            :limit => 2
    t.string   "phone",               :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["email"], :name => "index_clients_on_email", :unique => true

  create_table "galleries", :force => true do |t|
    t.integer  "photographer_id",                                  :null => false
    t.integer  "position",                          :default => 1, :null => false
    t.string   "title",              :limit => 100,                :null => false
    t.string   "keywords",           :limit => 200
    t.text     "description",                                      :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug",        :limit => 128
  end

  create_table "gallery_photos", :force => true do |t|
    t.integer  "gallery_id",                                          :null => false
    t.integer  "position",                          :default => 1,    :null => false
    t.string   "title",              :limit => 128,                   :null => false
    t.boolean  "featured",                          :default => true, :null => false
    t.integer  "featured_position",                 :default => 1,    :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "width"
    t.integer  "height"
    t.string   "camera_brand"
    t.string   "camera_model"
    t.string   "exposure_time"
    t.float    "f_number"
    t.integer  "iso_speed_rating"
    t.float    "focal_length"
    t.datetime "shot_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_product_sizes", :force => true do |t|
    t.integer "package_id",                         :null => false
    t.integer "product_size_id",                    :null => false
    t.boolean "active",          :default => false, :null => false
  end

  create_table "packages", :force => true do |t|
    t.integer  "photographer_id",                                                                :null => false
    t.integer  "position",                                                     :default => 1,    :null => false
    t.string   "title",           :limit => 128,                                                 :null => false
    t.decimal  "price",                          :precision => 8, :scale => 2,                   :null => false
    t.boolean  "active",                                                       :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.integer  "photographer_id",                                  :null => false
    t.integer  "position",                          :default => 1, :null => false
    t.string   "title",                                            :null => false
    t.string   "intro"
    t.string   "keywords",           :limit => 200
    t.text     "body",                                             :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug",        :limit => 128
  end

  create_table "photo_comments", :force => true do |t|
    t.integer  "photo_id",                        :null => false
    t.integer  "client_id"
    t.integer  "photographer_id"
    t.string   "body",            :limit => 2000, :null => false
    t.datetime "created_at"
  end

  create_table "photographers", :force => true do |t|
    t.string   "email",                   :limit => 100,                        :null => false
    t.string   "crypted_password",                                              :null => false
    t.string   "password_salt",                                                 :null => false
    t.string   "persistence_token",                                             :null => false
    t.string   "single_access_token",                                           :null => false
    t.string   "perishable_token",                                              :null => false
    t.integer  "login_count",                            :default => 0,         :null => false
    t.integer  "failed_login_count",                     :default => 0,         :null => false
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip",        :limit => 11
    t.string   "last_login_ip",           :limit => 11
    t.string   "company_name",            :limit => 64,                         :null => false
    t.string   "site_url",                                                      :null => false
    t.string   "company_email",           :limit => 100
    t.string   "company_phone",           :limit => 20
    t.string   "blog_url"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "google_analytics_key",    :limit => 20
    t.string   "google_verification_key", :limit => 50
    t.string   "theme",                   :limit => 40,  :default => "default", :null => false
    t.boolean  "use_watermark",                          :default => false,     :null => false
    t.string   "watermark_file_name"
    t.string   "watermark_content_type"
    t.integer  "watermark_file_size"
    t.datetime "watermark_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "home_page_title"
  end

  add_index "photographers", ["email"], :name => "index_photographers_on_email", :unique => true

  create_table "photos", :force => true do |t|
    t.integer  "booking_id",                        :null => false
    t.string   "title",              :limit => 128, :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "width"
    t.integer  "height"
    t.string   "camera_brand"
    t.string   "camera_model"
    t.string   "exposure_time"
    t.float    "f_number"
    t.integer  "iso_speed_rating"
    t.float    "focal_length"
    t.datetime "shot_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_sizes", :force => true do |t|
    t.integer  "product_id",                                                             :null => false
    t.integer  "position",                                                :default => 1, :null => false
    t.string   "title",      :limit => 128,                                              :null => false
    t.decimal  "price",                     :precision => 8, :scale => 2,                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "photographer_id",                                      :null => false
    t.integer  "position",                           :default => 1,    :null => false
    t.string   "title",              :limit => 128,                    :null => false
    t.string   "description",        :limit => 2000
    t.boolean  "active",                             :default => true, :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotes", :force => true do |t|
    t.integer  "photographer_id",                               :null => false
    t.integer  "position",                       :default => 1, :null => false
    t.string   "author",          :limit => 80,                 :null => false
    t.string   "body",            :limit => 200,                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope",          :limit => 40
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "scope", "sequence"], :name => "index_slugs_on_name_and_sluggable_type_and_scope_and_sequence", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

end
