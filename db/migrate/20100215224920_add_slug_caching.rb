class AddSlugCaching < ActiveRecord::Migration
  def self.up
    add_column :galleries, :cached_slug, :string, :limit => 128
    add_column :pages, :cached_slug, :string, :limit => 128
  end

  def self.down
    remove_column :galleries, :cached_slug
    remove_column :pages, :cached_slug
  end
end
