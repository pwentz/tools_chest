class Admin::ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

end
