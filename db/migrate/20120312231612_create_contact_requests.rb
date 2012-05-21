class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :email, :null => false, :limit => 100
      t.string :name, :limit => 64
      t.text :message, :null => false
      t.boolean :read, :null => false, :default => false

      t.timestamps
    end
    
    # We don't want to start at 0. TODO - change this to also work with MySQL.
    execute("SELECT setval('contact_requests_id_seq', #{(rand(999) + 1000)});") rescue nil
    
    add_index :contact_requests, :read
    add_index :contact_requests, :email
    add_index :contact_requests, :name
  end
end
