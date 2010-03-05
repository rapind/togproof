class AddPhotographerAssociations < ActiveRecord::Migration
  def self.up
    add_column :galleries, :photographer_id, :integer
    add_column :clients, :photographer_id, :integer
    add_column :pages, :photographer_id, :integer
    add_column :quotes, :photographer_id, :integer
  end

  def self.down
    remove_column :galleries, :photographer
    remove_column :clients, :photographer
    remove_column :pages, :photographer
    remove_column :quotes, :photographer
  end
end
