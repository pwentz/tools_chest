class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :show, :update, :destroy]
  def index
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to admin_categories_path(current_user.id)
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_category_path(current_user, @category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path(current_user)
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, tool_ids: [])
  end

end
