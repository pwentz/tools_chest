require 'rails_helper'

describe "Admin can delete tools" do
  scenario "they click button to remove category, and tools" do
    admin = create(:user, :role => 1)
    category_one, category_two = create_list(:category, 2)
    ApplicationController.any_instance.stub(:current_user).and_return(admin)
    
    visit admin_category_path(admin, category_one)

    click_link 'Delete this category'

    expect(current_path).to eq(admin_categories_path(admin))

    within("#category_list") do
      expect(page).to have_link(category_two.name)
      expect(page).not_to have_link(category_one.name)
    end
  end
end
