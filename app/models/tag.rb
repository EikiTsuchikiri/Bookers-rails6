class Tag < ApplicationRecord
  has_many :book_tags, dependent: :destroy
  has_many :books, through: :book_tags, dependent: :destroy

  validates :name, presence:true, uniqueness: true
end
