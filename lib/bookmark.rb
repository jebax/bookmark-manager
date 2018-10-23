require 'pg'

class Bookmark
  def self.all
    database = PG.connect(dbname: 'bookmark_manager')
    database.exec('SELECT * from bookmarks').map { |bookmark| bookmark['url'] }
  end
end
