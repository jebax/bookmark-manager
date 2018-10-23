require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == "test"
      database = PG.connect(dbname: 'bookmark_manager_test')
    else
      database = PG.connect(dbname: 'bookmark_manager')
    end
    database.exec('SELECT * from bookmarks').map { |bookmark| bookmark['title'] }
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
