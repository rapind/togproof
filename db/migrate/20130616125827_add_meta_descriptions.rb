class AddMetaDescriptions < ActiveRecord::Migration
  def up
    add_column :galleries, :meta_description, :string, :limit => 255
    add_column :pages, :meta_description, :string, :limit => 255
    add_column :photographers, :meta_description, :string, :limit => 255
    add_column :posts, :meta_description, :string, :limit => 255
  end
  
  def down
    remove_column :galleries, :meta_description
    remove_column :pages, :meta_description
    remove_column :photographers, :meta_description
    remove_column :posts, :meta_description
  end
end
