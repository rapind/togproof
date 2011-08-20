class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.integer :position
      t.string :title, :null => false, :limit => 64
      t.string :keywords, :limit => 200
      t.string :description, :limit => 2000
      t.string :cover

      t.integer :portfolio_photos_count, :null => false, :default => 0

      t.timestamps
    end
    add_index :portfolios, :position
  end
end
