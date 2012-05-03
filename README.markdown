# Grokphoto

Grokphoto is a professional photographer's client gallery solution.

This version is work in progress / port to rails 3.2.3

For the stable rails 2 version please see the version 2 branch:
[Version 2](https://github.com/rapind/grokphoto/tree/v2.0)


## Software Requirements

* ImageMagick
* SQLite3 or MySQL or PostgreSQL


## Installation

    git clone git://github.com/rapind/grokphoto.git
    cd grokphoto
    bundle

Then edit these files with your own settings. Everything you need to change is marked with TODO along with instructions if necessary:

*  config/database.yml
*  config/heroku.yml
*  config/initializers/devise.rb
*  config/initializers/secret_token.rb
*  config/initializers/session_store.rb

NOTE: You won't need to change all of these if you're deploying to Heroku. See Heroku Deployment below for details.


Then initialize the database and start the server:

    rake db:create
    rake db:migrate
    rake db:seed
    rails s

At this point you should have a working site with some basic seed data that you can start to customize.


## Initial Configuration

1. Login to the administration area (/admin) using grok@grokphoto.org / password
2. Click on the Settings tab.
3. Enter your own information and update the settings.


## Heroku Deployment

    heroku create --stack cedar
    git push heroku master

Before you seed the database you'll need to setup an amazon s3 account and bucket to have somewhere to store the files. Heroku has a temporary filesystem which is not an appropriate place to store images.

* Go to: https://console.aws.amazon.com/s3/home
* Create a bucket
* Go to: https://aws-portal.amazon.com/gp/aws/developer/account/index.html
* Click on the Security Credentials in the left nav, then the Access Credentials in the body.
* Copy your S3 key and your S3 secret key

Use your S3 information to fill in the config vars for heroku, then seed the database.

    heroku config:add S3_KEY=change_to_your_amazon_s3_key S3_SECRET=change_to_your_amazon_s3_secret S3_BUCKET=change_to_your_amazon_s3_bucket    

You still need to specify a secret roken and session store key:

    rake secret
    heroku config:add SESSION_KEY=_usually_you_app_name SECRET_TOKEN=token_from_rake_secret

The specify the email address to use when the system sends emails:

    heroku config:add SENDER_EMAIL=_your_email_address

You can check to make sure all of your heroku environment variables have been properly set using:

    heroko config
  
Once done, migrate and seed the database and launch the app.
	    
    heroku run rake db:migrate
    heroku run rake db:seed
    
Make sure you also enable Memchacd on heroku with the below command.

	heroku addons:add memcache:5mb   
   
Open up your shiny new grokphoto instance!

    heroku open


	 
## Features

* Personalize your site via the configuration / settings page.
* Manage and share private galleries with clients easily via secure URL.
* One-click photo uploads.


## TODO

* Internationalization.
* Photo commenting system for both you and your clients.
* Basic view statistics / history for your client galleries.


## Tests

To run the tests:

    rspec spec


## Credits

Sample photos were provided by and are copyright of Jaime Coyle Photography [http://jaimecoyle.com](http://jaimecoyle.com)


## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/2.5/ca/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/2.5/ca/88x31.png" /></a><br /><span xmlns:dc="http://purl.org/dc/elements/1.1/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dc:title" rel="dc:type">Grokphoto</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://github.com/rapind/grokphoto" property="cc:attributionName" rel="cc:attributionURL">http://github.com/rapind/grokphoto</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/2.5/ca/">Creative Commons Attribution-Share Alike 2.5 Canada License</a>.<br />Based on a work at <a xmlns:dc="http://purl.org/dc/elements/1.1/" href="http://github.com/rapind/grokphoto" rel="dc:source">github.com</a>.
