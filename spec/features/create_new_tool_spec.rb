# spec/features/create_new_tool_spec.rb
require "rails_helper"

describe "Create new tool", :type => :feature do
  scenario "User creates a new tool" do
    visit new_tool_path

    fill_in "Name", :with => "Screwdriver"
    click_button "create your tool"

    within("ul") do
      expect(page).to have_content("Screwdriver")
    end
  end
end
