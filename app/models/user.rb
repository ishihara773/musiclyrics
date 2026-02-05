class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # フォロー関係
  has_many :active_relationships,
           class_name: "Relationship",
           foreign_key: "follower_id",
           dependent: :destroy

  has_many :passive_relationships,
           class_name: "Relationship",
           foreign_key: "followed_id",
           dependent: :destroy

  has_many :followeds, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_one_attached :profile_image

  # フォローする
  def follow(user)
    active_relationships.create(followed: user)
  end

  # フォロー外す
  def unfollow(user)
    active_relationships.find_by(followed: user)&.destroy
  end

  # フォローしているか？
  def following?(user)
    followeds.include?(user)
  end
end
