class Admin::CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to admin_categories_path(current_user.id)
  end

  private

  def category_params
    params.require(:category).permit(:name, tool_ids: [])
  end

end
