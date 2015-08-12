class CategoriesController < ApplicationController

	def index
		@categories = Category.paginate(page: params[:page])
	end

	def show
		@category = Category.find_by(id: params[:id])
    @lessons = @category.lessons.all
	end

end
