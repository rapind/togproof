class CreatePortfolioPhotos < ActiveRecord::Migration
  def change
    create_table :portfolio_photos do |t|
      t.references :portfolio, :null => false
      t.integer :position
      t.string :title, :null => false, :limit => 100
      t.string :photo

      t.timestamps
    end
    add_index :portfolio_photos, :portfolio_id
    add_index :portfolio_photos, [:portfolio_id, :position]
  end
end
