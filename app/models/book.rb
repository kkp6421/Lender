class Book < ApplicationRecord
  belongs_to :owner

  has_many :book_borrowers
  has_many :borrowers, through: :book_borrowers

  validates :ISBN, presence: true
  validates :name, presence: true
  validates :author, presence: true
  validates :publisher, presence: true

  def self.search(search)
    return Book.all unless search
    Book.where("name LIKE ?", "%#{search}%")
  end
end
