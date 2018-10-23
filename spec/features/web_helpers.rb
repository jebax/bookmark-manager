def database
  PG.connect(dbname: 'bookmark_manager_test')
end

def empty_table
  database.exec('TRUNCATE TABLE bookmarks')
end

def fill_table_with_three_examples
  database.exec("INSERT INTO bookmarks(id,url) VALUES(1,'http://makers.tech'),
  (2, 'http://google.com'),
  (3, 'http://www.destroyallsoftware.com')")
end
