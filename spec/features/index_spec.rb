feature "index page" do
  before do
    empty_table
  end

  scenario "user can visit the index page" do
    visit '/'
    expect(page).to have_content "Bookmark Manager"
  end
end
