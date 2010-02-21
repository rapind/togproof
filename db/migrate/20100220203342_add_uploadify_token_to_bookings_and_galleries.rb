class AddUploadifyTokenToBookingsAndGalleries < ActiveRecord::Migration
  def self.up
    add_column :bookings, :uploadify_token, :string, :limit => 32
    add_column :galleries, :uploadify_token, :string, :limit => 32
  end

  def self.down
    remove_column :bookings, :uploadify_token
    remove_column :galleries, :uploadify_token
  end
end
