class CreatePhotographers < ActiveRecord::Migration
  def self.up
    create_table :photographers do |t|
      t.string    :email,               :null => false, :limit => 100
      t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :persistence_token,   :null => false
      t.string    :single_access_token, :null => false                # optional, see Authlogic::Session::Params
      t.string    :perishable_token,    :null => false                # optional, see Authlogic::Session::Perishability

      # Magic columns, just like ActiveRecord's created_at and updated_at. These are automatically maintained by Authlogic if they are present.
      t.integer   :login_count,         :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.integer   :failed_login_count,  :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.datetime  :current_login_at                                   # optional, see Authlogic::Session::MagicColumns
      t.datetime  :last_login_at                                      # optional, see Authlogic::Session::MagicColumns
      t.string    :current_login_ip,    :limit => 11                  # optional, see Authlogic::Session::MagicColumns
      t.string    :last_login_ip,       :limit => 11                  # optional, see Authlogic::Session::MagicColumns
      
      t.string    :company_name,        :null => false, :limit => 64
      t.string    :site_url,            :null => false, :limit => 255
      t.string    :company_email,       :limit => 100
      t.string    :company_phone,       :limit => 20
      t.string    :blog_url,            :limit => 255
      t.string    :facebook_url,        :limit => 255
      t.string    :twitter_url,         :limit => 255
      t.string    :google_analytics_key, :limit => 20
      t.string    :google_verification_key, :limit => 50
      
      
      t.string :theme, :limit => 40, :null => false, :default => 'default'      
      t.boolean :use_watermark, :null => false, :default => false
      
      # paperclip attachment fields
      t.string :watermark_file_name
      t.string :watermark_content_type
      t.integer :watermark_file_size
      t.datetime :watermark_updated_at
      
      t.timestamps
    end
    add_index :photographers, :email, :unique => true
  end

  def self.down
    drop_table :photographers
  end
end
