class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, length: { minimum: 8, maximum: 40 }
  validates :post_text, length: { minimum: 20, maximum: 255 }
end
