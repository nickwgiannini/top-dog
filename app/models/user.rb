class User < ApplicationRecord
  validates_presence_of :email, :encrypted_password, :role, :sign_in_count

  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/
  def admin?
    role == 'admin'
  end
end
