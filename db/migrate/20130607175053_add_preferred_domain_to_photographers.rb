class AddPreferredDomainToPhotographers < ActiveRecord::Migration
  def change
    add_column :photographers, :preferred_domain, :string, :limit => 255
  end
end
