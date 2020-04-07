class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # before_validation :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :name, presence: true, length: {maximum: 20, minimum: 2}
         validates :introduction, length: {maximum: 50}
    #        validates :latitude, presence: true
    # validates :longitude, presence: true
  has_many :books
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  attachment :profile_image


  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :followed_user, through: :followed, source: :follower


  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    following_user.include?(user)
  end

  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("name LIKE?", "%#{query}%")
      end
      rel
    end
  end



  geocoded_by :address
  after_validation :geocode
  # after_validation :debug

  def address
      self.address = self.prefecture_name + self.address_city + self.address_street
  end



end
