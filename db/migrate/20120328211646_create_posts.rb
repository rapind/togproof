class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => false, :limit => 64
      t.string :keywords, :limit => 255
      t.text :body, :null => false
      t.string :image_uid
      t.string :image_name

      t.timestamps
    end
  end
end
