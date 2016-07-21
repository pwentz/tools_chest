require 'rails_helper'

describe "Admin can create categories" do
  scenario "they fill out the form, click, submit, and are redirected to categories" do
    admin = create(:user, :role => 1)
    tool_one, tool_two, tool_three = create_list(:tool, 3, :category => nil)
    category_name = Faker::Superhero.power
    ApplicationController.any_instance.stub(:current_user).and_return(admin)

    visit new_admin_category_path(admin)

    fill_in "category[name]", with: category_name

    within(".tools") do
      page.check tool_two.id
      page.check tool_three.id
    end
    click_button "Create Category"

    expect(admin_categories_path(admin)).to eq(current_path)

    click_link category_name

    within("#tools_list") do
      expect(page).to have_link(tool_two.name)
      expect(page).to have_link(tool_three.name)
    end
  end
end
