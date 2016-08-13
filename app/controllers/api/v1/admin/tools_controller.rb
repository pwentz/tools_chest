class Api::V1::Admin::ToolsController < Api::V1::BaseController

  def index
    respond_with Tool.all
  end

  def create
    respond_with Tool.create(tool_params)
  end

  def update
    respond_with Tool.update(params[:id], tool_params)
  end

  def destroy
    respond_with Tool.destroy(params[:id])
  end

  private

  def tool_params
    params.require(:tool).permit(:id, :name, :price, :quantity, :category_id, :user_id)
  end
end
