class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_tags, dependent: :destroy
  has_many :tags, through: :book_tags, dependent: :destroy

  validates :title, presence:true
  validates :body, presence:true, length:{maximum:200}

  scope :latest, -> {order(created_at: :desc)}
  scope :star_count, -> {order(star: :desc)}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%'+content)
    else
      Book.where('title LIKE ?', '%'+content+'%')
    end
  end

  def save_tags(tags)
    tags.each do |tag|
      book_tag = Tag.find_or_create_by(name:tag)
      self.tags << book_tag
    end
  end
end
