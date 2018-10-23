require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
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
      Bookmark.new(bookmark['id'].to_i, bookmark['title'], bookmark['url'])
    end
  end

  def self.create(title, url)
    if ENV['ENVIRONMENT'] == "test"
      database = PG.connect(dbname: 'bookmark_manager_test')
    else
      database = PG.connect(dbname: 'bookmark_manager')
    end
    database.exec("INSERT INTO bookmarks(title,url) VALUES('#{title}','#{url}') RETURNING id, title, url")
  end
end
