class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :email, :null => false, :limit => 100
      t.string :subject, :null => false, :limit => 128
      t.string :name, :limit => 64
      t.text :body

      t.timestamps
    end
    
    # We don't want to start at 0.
    execute "SELECT setval('contact_requests_id_seq', #{(rand(999) + 1000)});"
  end
end
