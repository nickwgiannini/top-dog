class User < ApplicationRecord
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email, :encrypted_password, :role, :sign_in_count
  validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/
  validates_format_of :username, :with => /^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$/
  validates_format_of :first_name, :with => /^(?=.{2,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z]+(?<![_.])$/
  validates_format_of :last_name, :with => /^(?=.{2,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z]+(?<![_.])$/
 def admin?
   role == 'admin'
 end
end
