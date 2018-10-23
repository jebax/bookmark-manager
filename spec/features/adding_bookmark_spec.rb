feature 'adding a bookmark' do

  scenario 'add a bookmark' do
    visit '/bookmarks/new'
    fill_in :url, with: "www.theinternet.com"
    fill_in :title, with: 'The Internet'
    click_button 'Submit'
    expect(page).to have_current_path '/bookmarks'
    expect(page).to have_content "The Internet"
  end
end
