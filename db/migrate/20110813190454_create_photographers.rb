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

      t.string :name, :null => false, :limit => 100
      t.text :description, :null => false
      t.string :phone, :limit => 22
      t.string :logo

      t.string :blog_url
      t.string :facebook_url
      t.string :twitter_url
      t.string :google_analytics_key, :limit => 16
      t.string :disqus_short_name, :limit => 64
      t.text :conversion_code

      t.integer :gallery_photos_count, :null => false, :default => 0
      t.integer :portfolio_photos_count, :null => false, :default => 0

      t.timestamps
    end

    add_index :photographers, :email, :unique => true
    add_index :photographers, :reset_password_token, :unique => true
    add_index :photographers, :unlock_token, :unique => true
  end
end
