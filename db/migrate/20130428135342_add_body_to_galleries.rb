class AddBodyToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :body, :text
  end
end
