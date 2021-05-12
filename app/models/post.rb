class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  validates :image, presence: true

  def squared_img
    image.attached? ? image.variant( resize: '600x600', crop: "600x600+0+0", gravity: 'center', extent: '600x600' ) : ''
  end
end
