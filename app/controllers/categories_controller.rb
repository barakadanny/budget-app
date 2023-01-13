class CategoriesController < ApplicationController
  def index
    @categories = Category.where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to categories_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :user_id)
  end
end
