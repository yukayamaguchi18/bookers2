class TagSearchesController < ApplicationController

  def search
    @model = Book
    @word = params[:content]
    @records = Book.where("category LIKE ?", "%#{@word}%")
    render "tag_searches/tagsearch"
  end

end
