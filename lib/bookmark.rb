require 'pg'
require 'pry'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id.to_i
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == "test"
      database = PG.connect(dbname: 'bookmark_manager_test')
    else
      database = PG.connect(dbname: 'bookmark_manager')
    end
    database.exec('SELECT * from bookmarks').map do |bookmark|
      Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
    end
  end

  def self.create(title, url)
    if ENV['ENVIRONMENT'] == "test"
      database = PG.connect(dbname: 'bookmark_manager_test')
    else
      database = PG.connect(dbname: 'bookmark_manager')
    end
    database.exec("INSERT INTO bookmarks(title,url) VALUES('#{title}','#{url}')")
  end
end
