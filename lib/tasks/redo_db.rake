namespace :db do
  desc "Drop, create, migrate then seed the database"
  task :redo => :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
    Rake::Task['db:test:prepare'].invoke
  end

  desc "Remove all seed data (with callbacks) then reseed the database"
  task :reseed => :environment do
    # Remove all old data
    Photo.destroy_all
    Gallery.destroy_all
    PrivateGallery.destroy_all
    Page.destroy_all
    Post.destroy_all
    Photographer.destroy_all

    # Seed
    Rake::Task['db:seed'].invoke
  end
end