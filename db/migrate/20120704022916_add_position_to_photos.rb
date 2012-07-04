class AddPositionToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :position, :integer
  end
end
