# Simple RSS Downloader #


If you have an RSS feed and you want to be able to download the entries
of the feed and pass them to an application to either download the feed
or what have you.

For my purposes I wanted these to run at a certain interval so I
included the whenever gem so that I could create a cronjob to run this
script for me.

Also, I needed a very simple database so the application uses sqlite and
I added the ActiveRecord ORM to help out with creating the database.

## Copyright

Copyright © 2012 Danish Khan. See [MIT-LICENSE](https://github.com/danishkhan/RSS-Downloader/blob/master/MIT-LICENSE) for details.
