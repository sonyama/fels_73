class WordsController < ApplicationController

  def index
    word_filter
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def word_filter
    @categories = Category.all
    if params[:filter_state]
      @words = Word.by_category(params[:category_id])
        .paginate page: params[:page], per_page: Settings.paginate_per_page
      #byebug
    else
      @words = Word.paginate page: params[:page], per_page: Settings.paginate_per_page
    end
  end
end
