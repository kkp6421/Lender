class Book < ApplicationRecord
  belongs_to :owner

  validates :ISBN, presence: true
  validates :name, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
end
