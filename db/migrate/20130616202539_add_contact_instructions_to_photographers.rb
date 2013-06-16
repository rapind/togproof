class AddContactInstructionsToPhotographers < ActiveRecord::Migration
  def change
    add_column :photographers, :contact_instructions, :string, :limit => 512
  end
end
