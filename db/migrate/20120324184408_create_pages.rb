class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name, :null => false, :limit => 20
      t.string :keywords, :limit => 255
      t.text :body, :null => false
      t.string :image_uid
      t.string :image_name

      t.timestamps
    end
  end
end
