class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page])
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Created new category!"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Can not create!"
      redirect_to admin_categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :description
  end

end
