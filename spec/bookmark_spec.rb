require 'bookmark'

describe Bookmark do

  describe '::all' do
    before do
      fill_table_with_three_examples
    end

    it 'returns a list of all bookmarks' do
      bookmarks = described_class.all
      expect(bookmarks).to include "Makers"
      expect(bookmarks).to include "Destroy All Software"
      expect(bookmarks).to include "Google"
    end
  end

  describe "::create" do
    it "can add a bookmark" do
      described_class.create("The Internet", "http://www.theinternet.com")
      expect(described_class.all).to include "The Internet"
    end
  end
end
