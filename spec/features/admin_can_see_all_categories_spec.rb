require 'rails_helper'

describe "Admin can see all categories" do
  scenario "they can see all categories from categories index" do
    admin = create(:user)
    category_one, category_two = create_list(:category, 2)

    visit admin_categories_path(admin)

    expect(
      page.find("ul")
    ).to have_link(category_one.name)

    expect(
      page.find("ul")
    ).to have_link(category_two.name)
  end
end
