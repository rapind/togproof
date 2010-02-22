Grokphoto
=========

Grokphoto is a professional photographer's client and booking management solution, as well as a gallery / portfolio where they can showcase for their work.

There's a live demo available at:

* [http://www.grokphoto.org](http://www.grokphoto.org)

You can access the admin area at:

* [http://www.grokphoto.org/admin](http://www.grokphoto.org/admin)
* Email: photographer@grokphoto.org
* Password: password

You can access the client area at:

* [http://www.grokphoto.org/client](http://www.grokphoto.org/client)
* Email: client@grokphoto.org
* Password: password


<object id="scPlayer" width="995" height="660">
  <param name="movie" value="http://content.screencast.com/users/rapind/folders/Default/media/9b986ee1-3755-4428-a528-402cb147584c/bootstrap.swf"></param>
  <param name="quality" value="high"></param> <param name="bgcolor" value="#FFFFFF"></param>
  <param name="flashVars" value="thumb=http://content.screencast.com/users/rapind/folders/Default/media/9b986ee1-3755-4428-a528-402cb147584c/FirstFrame.jpg&containerwidth=995&containerheight=660&content=http://content.screencast.com/users/rapind/folders/Default/media/9b986ee1-3755-4428-a528-402cb147584c/grokphoto_manage_galleries.swf"></param>
  <param name="allowFullScreen" value="true"></param> <param name="scale" value="showall"></param> <param name="allowScriptAccess" value="always"></param>
  <param name="base" value="http://content.screencast.com/users/rapind/folders/Default/media/9b986ee1-3755-4428-a528-402cb147584c/"></param>
  <embed src="http://content.screencast.com/users/rapind/folders/Default/media/9b986ee1-3755-4428-a528-402cb147584c/bootstrap.swf" quality="high" bgcolor="#FFFFFF" width="995" height="660" type="application/x-shockwave-flash" allowScriptAccess="always" flashVars="thumb=http://content.screencast.com/users/rapind/folders/Default/media/9b986ee1-3755-4428-a528-402cb147584c/FirstFrame.jpg&containerwidth=995&containerheight=660&content=http://content.screencast.com/users/rapind/folders/Default/media/9b986ee1-3755-4428-a528-402cb147584c/grokphoto_manage_galleries.swf" allowFullScreen="true" base="http://content.screencast.com/users/rapind/folders/Default/media/9b986ee1-3755-4428-a528-402cb147584c/" scale="showall"></embed>
</object>

The Story
---------

I needed to build a professional photography site for a friend along with a way for her to easily manage clients, bookings, and photos.

While there are plenty of open source galleries out there, most are written in PHP whereas my personal preference is Ruby on Rails. Also, I was unable to find any that supported the more advanced features we needed for managing client photos and workflow.

And so grokphoto was born.

Software Requirements
---------------------

* ImageMagick
* MySQL (I haven't tested it with Postgres or sqlite3, but it *should* work.)

Installation
------------

Installation script coming soon! Follow these instructions for now:

    $ git clone git://github.com/rapind/grokphoto.git
    $ cd grokphoto
    $ cp config/database.yml.sample config.database.yml
    $ cp config/initializers/grokphoto.rb.sample config/initializers/grokphoto.rb
    $ cp config/deploy.rb.sample deploy.rb

Then edit these three files with your own settings. Everything you need to change is marked with a "TODO":

    $ sudo gem install less  
    $ sudo rake:gems:install
    $ rake db:create
    $ rake db:migrate
    $ rake db:seed
    $ script/server

At this point you should have a working site with some basic sample data that you can configure with your own data.

Initial Configuration
---------------------

1. Login to the administration area using photographer@grokphoto.org / password
2. Click on the Settings tab.
3. Enter your own information and update the settings.
4. Galleries holds the front page slide images and the photos within each of your galleries.
5. Client holds your client information and their photos (within bookings).

Features
--------

* Personalize your site via the configuration / settings page.
* Manage clients.
* Manage your own galleries / portfolios / showcase.
* Manage your own pages with markdown.
* Manage bookings for clients, with expiry dates.
* Manage photos for client bookings using one-click multiple image uploads.
* Automatically apply a watermark to all of your booking photos.
* Client only area where clients can review and comment on their photos.
* Photo commenting system for both you and your clients.
* Friendly slugs for your galleries and pages (SEO).
* Google compliant sitemap.
* Google analytics integration.
* Flash based front page image slides.
* Javascript based photo galleries.
* Stats on when your clients last logged in (good to know if they haven't visited their booking gallery before it expired).


Features being worked on
------------------------

* Print package management and client orders.
* Storefront for stock photos.

Themes
------

ERB and HAML based themes are supported and can be found in the /themes directory (off the project's root).

I've tried to keep these as simple as possible for now and they're just for the public area of your site. I don't see the value in theming the  admin or client sections for now. These are fairly generic anyways.

Each theme has it's own directory, and the easiest way to get started building your theme is to copy the default theme to a new directory. I.e. "cp -r themes/default themes/mycustomtheme"


Issues
------

Right now, the auto-watermarking is disabled as I try to debug an ImageMagick lib path issue in the production environment. You can very easily turn it on by editing the app/models/photo.rb file (look for the commented code).


Credits
-------

* [http://github.com/thoughtbot/paperclip](http://github.com/thoughtbot/paperclip)
* [http://github.com/josevalim/inherited_resources](http://github.com/josevalim/inherited_resources)
* [http://github.com/binarylogic/authlogic](http://github.com/binarylogic/authlogic)
* [http://github.com/nex3/haml](http://github.com/nex3/haml)
* [http://github.com/cloudhead/less](http://github.com/cloudhead/less)
* [http://github.com/rtomayko/rdiscount](http://github.com/rtomayko/rdiscount)
* [http://devkick.com/lab/galleria/](http://devkick.com/lab/galleria/)
* [http://www.progressivered.com/cu3er/](http://www.progressivered.com/cu3er/)
* Sample photos were provided by and are copyright of Jaime Coyle Photography [http://jaimecoyle.com](http://jaimecoyle.com)


License
-------

<a rel="license" href="http://creativecommons.org/licenses/by-sa/2.5/ca/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/2.5/ca/88x31.png" /></a><br /><span xmlns:dc="http://purl.org/dc/elements/1.1/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dc:title" rel="dc:type">Grokphoto</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://github.com/rapind/grokphoto" property="cc:attributionName" rel="cc:attributionURL">http://github.com/rapind/grokphoto</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/2.5/ca/">Creative Commons Attribution-Share Alike 2.5 Canada License</a>.<br />Based on a work at <a xmlns:dc="http://purl.org/dc/elements/1.1/" href="http://github.com/rapind/grokphoto" rel="dc:source">github.com</a>.
