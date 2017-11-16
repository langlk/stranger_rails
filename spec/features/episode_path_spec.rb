require "rails_helper"

describe "the episode management process" do
  it "allows user to add an episode" do
    visit episodes_path
    click_link "Add an Episode"
    fill_in "Title", with: "MADMAX"
    fill_in "Season", with: 2
    fill_in "Number", with: 1
    fill_in "Description", with: "So it begins. Again."
    click_on "Create Episode"
    expect(page).to have_content('Episode created!')
    expect(page).to have_content('MADMAX')
  end

  it "allows user to delete an episode" do
    ep = Episode.create(title: "Test", season: 3, number: 200, description: "Drama!")
    visit episode_path(ep)
    click_link "Delete"
    visit episodes_path
    expect(page).to have_no_content("Test")
  end
end
