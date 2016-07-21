class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :edit, :destroy]

  def index
    if current_user
      redirect_to user_path(current_user)
    else
      flash.notice = "You must login first to see your tools"
    end
  end

  def new
    @tool = Tool.new
  end

  def show
  end

  def create
    @tool = current_user.tools.new(tool_params)
    if @tool.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update
    Tool.find(params["id"]).update_attributes(tool_params)
    redirect_to tool_path(params["id"])
  end

  def edit
  end

  def destroy
    @tool.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_tool
    @tool = Tool.find(params["id"])
  end

  def tool_params
    params.require(:tool).permit(:name, :quantity, :price, :category_id)
  end
end
