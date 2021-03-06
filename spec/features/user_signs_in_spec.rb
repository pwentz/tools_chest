require 'rails_helper'

describe "User signs in", :type => :feature do
  context "user has no tools" do
    scenario "they don't see a sign in box, and view any tools they have" do
      user = create(:user)
      visit root_path

      click_link 'login'

      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_button "login"

      expect(current_path).to eq(user_path(user))

      expect(
        page.find(".flash_success")
      ).to have_content("Successfully signed in!")

      expect(
        page.find("#login")
      ).to have_content("logout")

      expect(page.find("h5")).to have_text("You need some tools!")
    end
  end
end
