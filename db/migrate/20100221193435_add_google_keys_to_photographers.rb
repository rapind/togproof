class AddGoogleKeysToPhotographers < ActiveRecord::Migration
  def self.up
    add_column :photographers, :google_analytics_key, :string, :limit => 20
    add_column :photographers, :google_verification_key, :string, :limit => 50
  end

  def self.down
    remove_column :photographers, :google_analytics_key
    remove_column :photographers, :google_verification_key
  end
end
