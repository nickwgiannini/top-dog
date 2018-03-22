class User < ApplicationRecord
  has_many :reviews
  has_many :breeds
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :email, :encrypted_password

end
