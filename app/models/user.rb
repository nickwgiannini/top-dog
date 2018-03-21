class User < ApplicationRecord
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email, :encrypted_password

  mount_uploader :avatar, AvatarUploader
end
