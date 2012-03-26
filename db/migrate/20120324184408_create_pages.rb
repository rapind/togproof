class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name, :null => false, :limit => 32
      t.string :image
      t.text :body, :null => false

      t.timestamps
    end
  end
end
