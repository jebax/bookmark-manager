def database
  PG.connect(dbname: 'bookmark_manager_test')
end

def empty_table
  database.exec('DROP TABLE IF EXISTS bookmarks')
  database.exec('CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60))')
end

def fill_table_with_three_examples
  Bookmark.create("http://makers.tech")
  Bookmark.create("http://google.com")
  Bookmark.create("http://www.destroyallsoftware.com")
end
