class AddKeywordsToPhotographers < ActiveRecord::Migration
  def change
    add_column :photographers, :keywords, :string, :limit => 255
  end
end
