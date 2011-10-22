# Be sure to restart your server when you modify this file.

# Replace the change_me below with the name of your application (no spaces or special characters though).
Grokphoto::Application.config.session_store :cookie_store, :key => ENV['SESSION_KEY'] || '_change_me'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Grokphoto::Application.config.session_store :active_record_store
