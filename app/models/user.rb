class User < ApplicationRecord
  has_one :author
  has_many :reviews
  has_many :books, through: :reviews

  validates :agreement, acceptance: true
end
