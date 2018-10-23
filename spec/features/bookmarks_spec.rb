feature 'viewing a list of bookmark' do
  before do
    empty_table
    fill_table_with_three_examples
  end

  scenario 'list bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://google.com"
    expect(page).to have_content "http://makers.tech"
  end
end
