require 'rails_helper'

describe "User visits their user page", :type => :feature do
  context "user is not signed in" do
    scenario "they see no tools" do
      tool = create(:tool)
      visit root_path

      expect(
        page.find(".flash_notice")
      ).to have_content("You must login first to see your tools")

      expect(page).not_to have_css("#tools_chest")
    end
  end

  context "user signs in" do
    scenario "they see their tools" do
      user = create(:user)
      tool = create(:tool, :user => user)

      visit root_path

      click_link 'login'

      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_button "login"

      expect(page).to have_css("#tools_chest")
      expect(
        page.find("#tools_chest")
      ).to have_content(tool.name)
    end
  end
end
