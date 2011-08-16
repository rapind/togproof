class CreatePhotographers < ActiveRecord::Migration
  def change
    create_table :photographers do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.string :name
      t.string :phone
      t.string :blog_url
      t.string :facebook_url
      t.string :twitter_url
      t.string :google_analytics_key
      t.boolean :use_watermark

      t.timestamps
    end

    add_index :photographers, :email,                :unique => true
    add_index :photographers, :reset_password_token, :unique => true
  end
end
