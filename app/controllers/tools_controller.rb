class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def show
    @tool = Tool.find(params["id"])
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
    @tool = Tool.find(params["id"])
  end

  def destroy
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end
end
