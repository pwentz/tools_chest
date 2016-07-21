# spec/features/create_new_tool_spec.rb
require "rails_helper"

describe "Create new tool", :type => :feature do
  scenario "User creates a new tool" do
    user = create(:user)
    category_one, category_two = create_list(:category, 2)
    tool_name = Faker::Superhero.name
    ApplicationController.any_instance.stub(:current_user).and_return(user)

    visit root_path

    click_link "Create tool"
    fill_in "tool[name]", with: tool_name
    fill_in "tool[price]", with: "9.99"
    find("select").find(:option, category_two.name).select_option
    click_button "create your tool"

    click_link tool_name

    expect(
      page.find("ul")
    ).to have_content("Name: #{tool_name}")

    expect(
      page.find("ul")
    ).to have_content("Price: $9.99")

    expect(
      page.find("ul")
    ).to have_content("Category: #{category_two.name}")

  end
end
