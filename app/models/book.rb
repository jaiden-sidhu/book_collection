class Book < ApplicationRecord
  has_many :reviews
  has_one :publisher
  validates :title, presence: true
  validates :author, presence: true
  validates :price, presence: true
  validates :published_date, presence: true
end
