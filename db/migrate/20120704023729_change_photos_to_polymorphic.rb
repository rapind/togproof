class ChangePhotosToPolymorphic < ActiveRecord::Migration
  def up
    # Add the new polymorphic columns
    add_column :photos, :photoable_id, :integer
    add_column :photos, :photoable_type, :string
    add_index :photos, [:photoable_id, :photoable_type]

    # Tranfer old IDs to polymorphic ones
    Photo.all.each do |photo|
      if !photo.gallery_id.blank?
        photo.photoable_id = photo.gallery_id
        photo.photoable_type = 'Gallery'
      elsif !photo.private_gallery_id.blank?
        photo.photoable_id = photo.private_gallery_id
        photo.photoable_type = 'PrivateGallery'
      end
      photo.save
    end

    # Update gallery counts
    Gallery.all.each do |gallery|
      gallery[:photos_count] = gallery.photos.count
      gallery.save
    end
    PrivateGallery.all.each do |private_gallery|
      private_gallery[:photos_count] = private_gallery.photos.count
      private_gallery.save
    end

    # Remove the old indexes
    remove_index :photos, :private_gallery_id
    remove_index :photos, [:private_gallery_id, :created_at]
    remove_index :photos, :gallery_id

    # Remove the old columns
    remove_column :photos, :gallery_id
    remove_column :photos, :private_gallery_id
  end

  def down
    # Add the old columns
    add_column :photos, :gallery_id, :integer
    add_column :photos, :private_gallery_id, :integer

    # Add the old indexes
    add_index :photos, :private_gallery_id
    add_index :photos, [:private_gallery_id, :created_at]
    add_index :photos, :gallery_id

    # Tranfer polymorphic IDs to old ones
    Photo.all.each do |photo|
      if photo.photoable_type == 'Gallery'
        photo.gallery_id = photo.photoable_id
      elsif photo.photoable_type == 'PrivateGallery'
        photo.private_gallery_id = photo.photoable_id
      end
      photo.save
    end

    # Remove the new polymorphic columns
    remove_index :photos, [:photoable_id, :photoable_type]
    remove_column :photos, :photoable_id
    remove_column :photos, :photoable_type
  end
end
