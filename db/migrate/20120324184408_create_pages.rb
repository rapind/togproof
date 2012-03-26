class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name, :null => false, :limit => 32
      t.string :keywords, :limit => 255
      t.text :body, :null => false
      t.string :image

      t.timestamps
    end
  end
end
