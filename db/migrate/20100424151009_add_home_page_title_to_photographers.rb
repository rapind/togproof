class AddHomePageTitleToPhotographers < ActiveRecord::Migration
  def self.up
    add_column(:photographers, :home_page_title, :string)
  end

  def self.down
    remove_column(:photographers, :home_page_title)
  end
end
