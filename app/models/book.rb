class Book < ApplicationRecord

  #ActiveStorageを使って画像を持たせる記述
  has_one_attached :image

  #user_idに関連づけ
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
