require 'rails_helper'

describe "User can see tools by category" do
  scenario "they visit categories index and see only tools they own" do
    user = create(:user)
    category = create(:category)
    tool_one = create(:tool, :category => category, :user => user)
    tool_two = create(:tool, :category => category)
    ApplicationController.any_instance.stub(:current_user).and_return(user)
    
    visit tool_path(tool_one)
    click_link category.name

    expect(current_path).to eq(category_path(category))
    expect(
      page.find("#tools_list")
    ).to have_link(tool_one.name)

    expect(
      page.find("#tools_list")
    ).not_to have_link(tool_two.name)

    expect(page).not_to have_link("Edit this category")

    expect(page).not_to have_link("Delete this category")
  end
end
