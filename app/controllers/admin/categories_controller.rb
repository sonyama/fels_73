class Admin::CategoriesController < ApplicationController
  before_action :find_chosen_category, only: [:edit, :destroy, :update]

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

  def update
    if @category.update category_params
      flash[:success] = "Updated category success!"
      redirect_to admin_categories_path
    else
      flash[:danger] = "Can not update!"
      redirect_to admin_categories_path
    end
  end

	def destroy
		if @category.destroy
			flash[:success] = "Category deleted success!"
			redirect_to admin_categories_path
		else
			flase[:danger] = "Category delete fail!"
			redirect_to admin_categories_path
		end
	end


  private

  def find_chosen_category
    @category = find_object Category, params[:id]
  end

  def category_params
    params.require(:category).permit :name, :description
  end

end
