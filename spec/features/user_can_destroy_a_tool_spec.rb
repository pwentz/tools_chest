require 'rails_helper'

describe "User deletes a tool" do
  scenario "they are redirected to their page without tool" do
    user = create(:user)
    tool_one, tool_two = create_list(:tool, 2, :user => user)
    ApplicationController.any_instance.stub(:current_user).and_return(user)

    visit tool_path(tool_one)

    click_link 'Delete this tool'

    expect(
      page.find("#tools_chest")
    ).not_to have_content(tool_one.name)
  end
end
  
