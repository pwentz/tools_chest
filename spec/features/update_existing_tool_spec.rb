require "rails_helper"

describe "Update existing tool", :type => :feature do
  scenario "User updates an existing tool" do
    visit tools_path
    click_link "Create a new tool!"

    within("#new_tool") do
      fill_in "tool[name]", with: "Hand Saw"
      fill_in "tool[price]", with: "39"
      fill_in "tool[quantity]", with: "4"
      click_button "create your tool"
    end

    click_link "Edit tool"

    within(".edit_tool") do
      fill_in "tool[name]", with: "Chainsaw"
      fill_in "tool[price]", with: "250"
      fill_in "tool[quantity]", with: "1"
      click_button "Edit your tool"
    end

    expect(current_path).to eq(tool_path(1))

    within("ul") do
      expect(page).to have_content("Chainsaw")
      expect(page).not_to have_content("Hand Saw")
    end
  end
end
