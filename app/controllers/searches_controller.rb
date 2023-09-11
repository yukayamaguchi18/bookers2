class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @search = params[:search]
    @word = params[:word]

    if @range == ""
      @selected_range = "---選択してください---"
    elsif @range == "1"
      @selected_range = "User"
    elsif @range == "2"
      @selected_range = "Book"
    end

    if @search == "perfect_match"
      @selected_search = "完全一致"
    elsif @search == "forward_match"
      @selected_search = "前方一致"
    elsif @search == "backward_match"
      @selected_search = "後方一致"
    elsif @search == "partial_match"
      @selected_search = "部分一致"
    end

    if @range == '1'
      @records = User.search(@search,@word)
      render 'search'
    elsif @range == '2'
      @records = Book.search(@search,@word)
      render 'search'
    else
      redirect_to request.referer
    end
  end

end
