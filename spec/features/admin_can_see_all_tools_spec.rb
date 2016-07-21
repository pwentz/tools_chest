require 'rails_helper'

describe "Admin can see all tools" do
  scenario "they can see all tools by their particular category" do
    admin = create(:user, :role => 1)
    category = create(:category)
    tool_one, tool_two, tool_three = create_list(:tool, 3, :category => category)
    tool_four = create(:tool)
    ApplicationController.any_instance.stub(:current_user).and_return(admin)

    visit admin_categories_path(admin)

    click_link category.name

    expect(
      page.find("#tools_list")
    ).to have_link(tool_one.name)

    expect(
      page.find("#tools_list")
    ).to have_link(tool_two.name)

    expect(
      page.find("#tools_list")
    ).to have_link(tool_three.name)

    expect(
      page.find("#tools_list")
    ).not_to have_link(tool_four.name)
  end
end
