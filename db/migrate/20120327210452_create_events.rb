class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description, :null => false, :limit => 255

      t.timestamp :created_at
    end
  end
end
