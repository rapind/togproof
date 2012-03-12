# If we run into problems getting upload caches to work on heroku, please review
# https://github.com/jnicklas/carrierwave/wiki/How-to%3A-Make-Carrierwave-work-on-Heroku
# http://devcenter.heroku.com/articles/config-vars
CarrierWave.configure do |config|
  if ['production', 'staging'].include?(Rails.env)
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'

    # Use s3 storage in production
    config.storage = :fog
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV['S3_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET'],
      :region => 'us-east-1'
    }
    config.fog_directory = ENV['S3_BUCKET']
    config.fog_public = true
  else
    # Use local file storage for development and test environments
    config.storage = :file
  end

  # Turn off image processing during tests to speed them up.
  config.enable_processing = false if Rails.env == 'test'
end