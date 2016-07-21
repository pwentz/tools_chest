require "rails_helper"

describe "Update existing tool", :type => :feature do
  scenario "User updates an existing tool" do
    user = create(:user)
    tool = create(:tool, :user => user)
    ApplicationController.any_instance.stub(:current_user).and_return(user)

    visit root_path

    click_link tool.name
    click_link "Edit this tool"

    within(".edit_tool") do
      fill_in "tool[name]", with: "Chainsaw"
      fill_in "tool[price]", with: "250"
      fill_in "tool[quantity]", with: "1"
      click_button "Edit your tool"
    end

    expect(current_path).to eq(tool_path(1))

    within("ul") do
      expect(page).to have_content("Chainsaw")
      expect(page).not_to have_content(tool.name)
    end
  end
end
