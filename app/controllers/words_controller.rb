class WordsController < ApplicationController

  def index
    filter_word
  end

  private
  def filter_word
    @categories = Category.all
    if params[:filter_state]
      @words = Word.paginate page: params[:page], per_page: Settings.paginate_per_page
      #@words = Word.in_category(params[:category_id]).send(params[:filter_state], current_user)
      #  .paginate page: params[:page], per_page: Settings.paginate_per_page
    else
      @words = Word.paginate page: params[:page], per_page: Settings.paginate_per_page
    end
  end
end
