class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true

  def squared_img
    if image.attached?
      return image.variant( combine_options: { resize: '600x600', gravity: 'center', extent: '600x600' })
    end

    ''
  end
end
