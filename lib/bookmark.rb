require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == "test"
      database = PG.connect(dbname: 'bookmark_manager_test')
    else
      database = PG.connect(dbname: 'bookmark_manager')
    end
    database.exec('SELECT * from bookmarks').map { |bookmark| bookmark['url'] }
  end
  def self.create(url)
    if ENV['ENVIRONMENT'] == "test"
      database = PG.connect(dbname: 'bookmark_manager_test')
    else
      database = PG.connect(dbname: 'bookmark_manager')
    end
    database.exec("INSERT INTO bookmarks(url) VALUES('#{url}')")
  end
end
