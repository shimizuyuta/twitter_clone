class Micropost < ApplicationRecord
  belongs_to :user

  has_many :favorites
  has_many :fav_users,through: :favorites, source: :user

  mount_uploader :avatar, AvatarUploader


  def fav_users_all
    self.fav_users
  end
  

  validates :content, presence: true, length: {maximum: 255}

  


end
