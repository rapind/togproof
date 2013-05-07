class ChangeGalleryNameSize < ActiveRecord::Migration
  def up
    change_column :galleries, :name, :string, :limit => 30
  end

  def down
    change_column :galleries, :name, :string, :limit => 20
  end
end
