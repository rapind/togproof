# If we run into problems getting upload caches to work on heroku, please review
# https://github.com/jnicklas/carrierwave/wiki/How-to%3A-Make-Carrierwave-work-on-Heroku
CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'

  if Rails.env == 'production'
    # Use s3 storage in production
    config.storage = :fog
    config.fog_credentials = {
      :aws_access_key_id => ENV['S3_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET'],
      :provider => 'AWS'
    }
    config.fog_directory = ENV['S3_BUCKET']
    config.fog_public = true
  else
    # Use local file storage for development and test environments
    config.storage = :file
  end
end