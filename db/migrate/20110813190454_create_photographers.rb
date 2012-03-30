class CreatePhotographers < ActiveRecord::Migration
  def change
    create_table :photographers do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.token_authenticatable
      # t.encryptable
      # t.confirmable

      t.string :name, :null => false, :limit => 80
      t.string :tagline, :null => false, :limit => 128
      t.string :phone, :limit => 22
      t.string :time_zone, :limit => 40
      t.string :description, :limit => 255
      
      t.string :portfolio_url, :limit => 512
      t.string :blog_url, :limit => 512
      t.string :facebook_url, :limit => 255
      t.string :twitter_url, :limit => 255
      t.string :google_analytics_key, :limit => 16
      t.string :disqus_short_name, :limit => 64
      t.text :conversion_code

      t.timestamps
    end

    add_index :photographers, :email, :unique => true
    add_index :photographers, :reset_password_token, :unique => true
    add_index :photographers, :unlock_token, :unique => true
  end
end
