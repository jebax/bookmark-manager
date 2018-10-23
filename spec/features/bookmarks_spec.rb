feature 'viewing a list of bookmark' do
  before do
    fill_table_with_three_examples
  end

  scenario 'list bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "Destroy All Software"
    expect(page).to have_content "Google"
    expect(page).to have_content "Makers"
  end
  scenario 'visiting bookmark url' do
    visit '/bookmarks'
    click_link "Destroy All Software"
    expect(page).to have_current_path("http://www.destroyallsoftware.com")
  end
end
