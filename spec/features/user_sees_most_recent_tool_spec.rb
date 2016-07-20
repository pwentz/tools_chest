require 'rails_helper'

describe "User sees most recent tool", :type => :feature do
  scenario "they see the last tool they created" do
    user = create(:user)
    tool = create(:tool, :user => user)
    tool_name = Faker::Superhero.name
    ApplicationController.any_instance.stub(:current_user).and_return(user)

    visit user_path(user)
    click_link "Create tool"

    fill_in "tool[name]", with: tool_name
    fill_in "tool[price]", with: "115"
    click_button "create your tool"

    expect(
      page.find("#most_recent")
    ).to have_content(tool_name)

    expect(
      page.find("#most_recent")
    ).not_to have_content(tool.name)
  end
end

