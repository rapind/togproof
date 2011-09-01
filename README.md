Grokphoto
=========

Grokphoto is a professional photographer's client and booking management solution, as well as a gallery / portfolio where they can showcase for their work.

This version is work in progress / port to rails 3.1.

For the stable rails 2 version please see the version 2 branch:
[Version 2](https://github.com/rapind/grokphoto/tree/v2.0)


Software Requirements
---------------------

* ImageMagick
* SQLite3

Installation
------------

    $ git clone git://github.com/rapind/grokphoto.git
    $ cd grokphoto
    $ rake grokphoto:init
    $ bundle

Then edit these files with your own settings. Everything you need to change is marked with "change_me" along with instructions if necessary:

*  config/database.yml
*  config/heroku.yml
*  config/initializers/devise.rb
*  config/initializers/secret_token.rb
*  config/initializers/session_store.rb

Then initialize the database and start the server:

    $ rake db:create
    $ rake db:migrate
    $ rake db:seed
    $ rails s

At this point you should have a working site with some basic sample data that you can configure with your own data.

Initial Configuration
---------------------

1. Login to the administration area (/photog) using photographer@grokphoto.org / password
2. Click on the Settings tab.
3. Enter your own information and update the settings.

Features
--------

* Personalize your site via the configuration / settings page.
* Manage your portfolios and showcase your work.
* Manage your own pages with markdown.
* Manage and share client galleries.
* One-click photo uploads.
* Automatically apply a watermark to all of your gallery photos.
* Photo commenting system for both you and your clients.
* SEO Friendly URLs.
* Google compliant sitemap.
* Google analytics integration.
* Basic view statistics / history for your client galleries.

Themes
------

Themes will be supported somehow, possible using liquid markup. Still mulling this over.

Tests
-----

To run the tests:

    $ rspec test


Credits
-------

Sample photos were provided by and are copyright of Jaime Coyle Photography [http://jaimecoyle.com](http://jaimecoyle.com)


License
-------

<a rel="license" href="http://creativecommons.org/licenses/by-sa/2.5/ca/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/2.5/ca/88x31.png" /></a><br /><span xmlns:dc="http://purl.org/dc/elements/1.1/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dc:title" rel="dc:type">Grokphoto</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://github.com/rapind/grokphoto" property="cc:attributionName" rel="cc:attributionURL">http://github.com/rapind/grokphoto</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/2.5/ca/">Creative Commons Attribution-Share Alike 2.5 Canada License</a>.<br />Based on a work at <a xmlns:dc="http://purl.org/dc/elements/1.1/" href="http://github.com/rapind/grokphoto" rel="dc:source">github.com</a>.