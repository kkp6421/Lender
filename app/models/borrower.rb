class Borrower < ApplicationRecord
  has_many :book_borrowers
  has_many :books, through: :book_borrowers

  validates :name, presence: true
  validates :twitter_id, presence: true

  def self.search(search)
    return nil unless search
    Borrower.where("name LIKE ?", "%#{search}%")
  end
end
