class AddInstagramToPhotographers < ActiveRecord::Migration
  def change
    add_column :photographers, :instagram_id, :string, :limit => 128
  end
end
