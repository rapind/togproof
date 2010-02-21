class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string    :name,                :limit => 64
      t.string    :email,               :null => false, :limit => 100
      t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :persistence_token,   :null => false
      t.string    :single_access_token, :null => false                # optional, see Authlogic::Session::Params
      t.string    :perishable_token,    :null => false                # optional, see Authlogic::Session::Perishability

      # Magic columns, just like ActiveRecord's created_at and updated_at. These are automatically maintained by Authlogic if they are present.
      t.integer   :login_count,         :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.integer   :failed_login_count,  :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.datetime  :last_request_at                                    # optional, see Authlogic::Session::MagicColumns
      t.datetime  :current_login_at                                   # optional, see Authlogic::Session::MagicColumns
      t.datetime  :last_login_at                                      # optional, see Authlogic::Session::MagicColumns
      t.string    :current_login_ip,    :limit => 11                  # optional, see Authlogic::Session::MagicColumns
      t.string    :last_login_ip,       :limit => 11                  # optional, see Authlogic::Session::MagicColumns

      t.string :street_1, :limit => 128
      t.string :street_2, :limit => 100
      t.string :city, :limit => 64
      t.string :postal_code, :limit => 20
      t.string :country, :limit => 32
      t.string :province, :limit => 2
      t.string :phone, :limit => 20
      
      t.timestamps
    end
    add_index :clients, :email, :unique => true
  end

  def self.down
    drop_table :clients
  end
end
