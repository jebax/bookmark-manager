def database
  PG.connect(dbname: 'bookmark_manager_test')
end

def empty_table
  database.exec('DROP TABLE IF EXISTS bookmarks')
  database.exec('CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title VARCHAR(60), url VARCHAR(60))')
end

def fill_table_with_three_examples
  Bookmark.create("Makers", "http://makers.tech")
  Bookmark.create("Google", "http://google.com")
  Bookmark.create("Destroy All Software", "http://www.destroyallsoftware.com")
end
