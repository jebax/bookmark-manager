require 'bookmark'

describe Bookmark do

  describe '::all' do
    before do
      fill_table_with_three_examples
    end

    it 'returns bookmark objects' do
      bookmarks = described_class.all
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq "Makers"
      expect(bookmarks.first.url).to eq "http://makers.tech"
      expect(bookmarks.first.id).to eq 1
    end
  end

  describe "::create" do
    it "can add a bookmark" do
      described_class.create("The Internet", "http://www.theinternet.com")
      bookmarks = described_class.all
      expect(bookmarks.first.title).to eq "The Internet"
    end
  end
end
