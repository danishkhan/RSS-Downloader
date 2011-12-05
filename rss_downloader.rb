require 'feedzirra'
require 'whenever'
require File.expand_path('../feed_entry', __FILE__)

feed_url = RSS_URL

FeedEntry.update_from_feed(feed_url)
