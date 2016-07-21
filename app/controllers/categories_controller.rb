class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @tools = current_user.tools.where(category: @category)
  end

  def new
    @category = Category.new
  end
end
