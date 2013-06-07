class AddMetaTitles < ActiveRecord::Migration
  def change
    add_column :photographers, :meta_title, :string, :limit => 128
    add_column :galleries, :meta_title, :string, :limit => 128
    add_column :pages, :meta_title, :string, :limit => 128
    add_column :posts, :meta_title, :string, :limit => 128
  end
end
