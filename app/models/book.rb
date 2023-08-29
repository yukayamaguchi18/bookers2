class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :book_comments

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(search,word)
    if search == "forward_match"
      @book = Book.where("title LIKE? OR body LIKE?","#{word}%","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE? OR body LIKE?","%#{word}","%#{word}")
    elsif search == "perfect_match"
      @book = Book.where("title LIKE? OR body LIKE?","#{word}","#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE? OR body LIKE?","%#{word}%","%#{word}%")
    else
      @book = Book.all
    end
  end

end