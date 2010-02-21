class AddKeywordsToGalleryAndPage < ActiveRecord::Migration
  def self.up
    add_column :galleries, :keywords, :string, :limit => 200
    add_column :pages, :keywords, :string, :limit => 200
  end

  def self.down
    remove_column :galleries, :keywords
    remove_column :pages, :keywords
  end
end
