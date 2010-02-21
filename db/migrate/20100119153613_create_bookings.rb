class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.references :client, :null => false
      t.string :title, :null => false, :limit => 128
      t.date :occurs_on
      t.date :expires_on
      t.integer :price
      t.boolean :ready
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
