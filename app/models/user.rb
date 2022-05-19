class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         #Userが削除された時、Userが投稿した投稿したBookを全て削除する
        has_many :books, dependent: :destroy

        validates :name, uniqueness: true, length: { in: 2..20 }
        validates :introduction, length: { maximum: 50 }

        has_one_attached :profile_image

        #特定の処理を名前で呼び出す
        def get_profile_image(width, height)
          unless profile_image.attached?
            file_path = Rails.root.join('app/assets/images/no_image.jpg')
            profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
          end
          #引数に設定した値に画像サイズの変更
          profile_image.variant(resize_to_limit: [width, height]).processed
        end

end
