class CategoriesController < ApplicationController
  # before_action :set_category

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end
  #
  # def set_category
  #   @category = Category.find(params[:id])
  # end

  def params_category
    params.require(:category).permit(:name)
  end
end
