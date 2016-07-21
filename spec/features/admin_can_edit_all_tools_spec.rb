require 'rails_helper'

describe "Admin can edit all tools" do
  scenario "they can edit any tools, regardless if it is theirs" do
    admin = create(:user, :role => 1)
    user_one, user_two, user_three = create_list(:user, 3)
    tool = create(:tool, :user => user_one)
    ApplicationController.any_instance.stub(:current_user).and_return(admin)

    visit admin_tool_path(admin, tool)

    click_link 'Edit this tool'

    find("select:last").find(:option, user_three.username).select_option
    click_button 'Update Tool'

    expect(current_path).to eq(admin_tool_path(admin, tool.id))

    within("ul") do
      expect(page).to have_link(user_three.username)
      expect(page).not_to have_link(user_one.username)
    end
  end
end
