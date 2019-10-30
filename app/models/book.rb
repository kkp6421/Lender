class Book < ApplicationRecord
  belongs_to :owner

  validates :ISBN, presence: true
  validates :name, presence: true
  validates :author, presence: true
  validates :publisher, presence: true

  def self.search(search)
    return nil unless search.nil?
    Book.where("name LIKE ?", "%#{search}%")
  end
end
