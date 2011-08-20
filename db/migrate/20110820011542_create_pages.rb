class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :position
      t.string :title, :null => false, :limit => 64
      t.string :keywords, :limit => 200
      t.string :summary, :limit => 250
      t.text :body
      t.string :image

      t.timestamps
    end
    add_index :pages, :position
  end
end
