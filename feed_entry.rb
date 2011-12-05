require 'bundler/setup'
require 'rubygems'
require 'sqlite3'
require 'active_record'

class FeedEntry < ActiveRecord::Base

  def self.update_from_feed(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
  end

  def self.database_options
    options = {
        :adapter => "sqlite3",
        :database => "db/FILE.rb"
    }
  end

  private
  def self.add_entries(entries)
    entries.each do |entry|
      # Example entry for sqlite db. Change if need be.
      unless exists? :guid => entry.id
        create!(
          :name         => entry.title,
          :summary      => entry.summary,
          :url          => entry.url,
          :published_at => entry.published,
          :guid          => entry.id
        )
        system(%Q{open -a PATH_TO_APPLICATION '#{entry.url}'})
      end
    end
  end
end

ActiveRecord::Base.establish_connection(FeedEntry.database_options)

