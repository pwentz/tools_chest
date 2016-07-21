require 'rails_helper'

describe "Admin can create a tool" do
  scenario "they must assign a default user" do
    admin = create(:user, :role => 1)
    tool_name = Faker::Superhero.name
    user_one, user_two, user_three = create_list(:user, 3)
    ApplicationController.any_instance.stub(:current_user).and_return(admin)

    visit new_admin_tool_path(admin)

    fill_in "tool[name]", with: tool_name
    fill_in "tool[price]", with: "9.99"
    find("select:last").find(:option, user_one.username).select_option
    click_button "Create Tool"

    expect(current_path).to eq(admin_tool_path(admin, Tool.find_by(name: tool_name)))
    expect(find("ul")).to have_link(user_one.username)
  end
end


