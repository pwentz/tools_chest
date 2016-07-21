require 'rails_helper'

describe "Admin can edit categories" do
  scenario "they can add or remove tools and change name" do
    admin = create(:user, :role => 1)
    category = create(:category)
    tool_one, tool_two, tool_three = create_list(:tool, 3, :category => category)
    tool_four, tool_five, tool_six = create_list(:tool, 3)
    new_category_name = Faker::Superhero.name
    ApplicationController.any_instance.stub(:current_user).and_return(admin)

    visit admin_category_path(admin, category)

    click_link 'Edit this category'

    fill_in "category[name]", with: new_category_name

    within(".tools") do
      page.check(tool_five.id)
      page.uncheck(tool_one.id)
      page.uncheck(tool_two.id)
    end
    click_button 'Update Category'

    expect(current_path).to eq(admin_category_path(admin, category))
    expect(page.find("h5")).to have_content(new_category_name)

    within("ul") do
      expect(page).to have_link(tool_three.name)
      expect(page).to have_link(tool_five.name)
      expect(page).not_to have_link(tool_one.name)
      expect(page).not_to have_link(tool_two.name)
    end
  end
end
