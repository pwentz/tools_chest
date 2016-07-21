class Admin::ToolsController < ApplicationController
  before_action :set_tool, only: [:edit, :show, :update]

  def new
    @tool = Tool.new
  end

  def create
    tool = Tool.new(tool_params)
    if tool.save
      redirect_to admin_tool_path(current_user, tool)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tool.update_attributes(tool_params)
    redirect_to admin_tool_path(current_user, @tool)
  end

  def show
  end


  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity, :category_id, :user_id)
  end
end
