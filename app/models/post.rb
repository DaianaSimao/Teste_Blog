class Post < ApplicationRecord
  belongs_to :user
  has_many :comentarios, dependent: :destroy
  has_many :tag_posts, dependent: :destroy
  has_many :tags, through: :tag_posts
  validates :titulo, presence: true
  validates :body, presence: true
  validates :tag_ids, presence: true, on: :create
  
end
