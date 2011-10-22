# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

# **** Use "rake secret" to generate a new secret token and replace the change_me below with it.
Grokphoto::Application.config.secret_token = ENV['SECRET_TOKEN'] || '6be96f9f087c738b474c2cd68cb50544134755b9b8addc32d05ce9674395426a0f720c77ed8d39a967eec7b7f75b4ebebe4423a17513f77ffcfc1db0576c387d'
