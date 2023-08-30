class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    search = params[:search]
    word = params[:word]
    @word = params[:word]

    if @range == '1'
      @user = User.search(search,word)
    elsif @range == '2'
      @book = Book.search(search,word)
    else
      redirect_to request.referer
    end
  end

end
