class AddGoogleSiteVerification < ActiveRecord::Migration
  def up
    add_column :photographers, :google_verification, :string
  end

  def down
    remove_column :photographers, :google_verification
  end
end
