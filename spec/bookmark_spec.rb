require 'bookmark'

describe Bookmark do

  describe '::all' do
    before do
      fill_table_with_three_examples
    end
    it 'returns a list of all bookmarks' do
      bookmarks = described_class.all
      expect(bookmarks).to include "http://makers.tech"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://google.com"
    end
  end

  describe "::create" do
    it "can add a bookmark" do
      bookmark = "www.theinternet.com"
      described_class.create(bookmark)
      expect(described_class.all).to include bookmark
    end
  end
end
