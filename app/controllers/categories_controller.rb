class CategoriesController < ApplicationController
  def index
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

  def category_params
    params.require(:category).permit(:name, :user_id)
  end
end
