# GrokPhoto

GrokPhoto is a professional photographer's client gallery solution.

This version is work in progress / port to rails 3.2

For the stable rails 2 version please see the version 2 branch:
[Version 2](https://github.com/rapind/grokphoto/tree/v2.0)


## Software Requirements

* ImageMagick
* SQLite3 or MySQL or PostgreSQL


## Installation

    git clone git://github.com/rapind/grokphoto.git
    cd grokphoto
    bundle

Then initialize the database and start the server:

    rake db:create
    rake db:migrate
    rake db:seed
    rails server

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

You still need to specify a secret token and session store key:

    rake secret
    heroku config:add SESSION_KEY=_usually_your_app_name SECRET_TOKEN=_result_of_rake_secret

To specify the email address to use when the system sends emails:

    heroku config:add SENDER_EMAIL=_your_email_address

To specify the email host to use when the system sends emails:

    heroku config:add EMAIL_HOST=yourdomain.com

To specify an environment specific pepper to use when encrypting passwords:

    rake secret
    heroku config:add DEVISE_PEPPER=_result_of_rake_secret

You can check to make sure all of your heroku environment variables have been properly by listing them:

    heroko config
  
Once done, migrate and seed the database and launch the app.
	    
    heroku run rake db:migrate
    heroku run rake db:seed
    
Make sure you also enable memcached on heroku with the below command.

	heroku addons:add memcache:5mb   
   
Open up your shiny new GrokPhoto instance!

    heroku open

Don't forget to change your admin password using the "Forgot my password" feature.

	 
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


## UNLICENSE

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

In jurisdictions that recognize copyright laws, the author or authors of this software dedicate any and all copyright interest in the software to the public domain. We make this dedication for the benefit of the public at large and to the detriment of our heirs and successors. We intend this dedication to be an overt act of relinquishment in perpetuity of all present and future rights to this software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
