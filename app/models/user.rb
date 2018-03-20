class User < ApplicationRecord
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email, :encrypted_password, :role, :sign_in_count
  validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/
  validates_format_of :username, :with => /\A\w{4,16}\z/, message: "can't be blank. Characters can only be [a-z 0-9 . # - +]"
  validates_format_of :first_name, :with => /\A(?=.{2,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z]+(?<![_.])\z/, :allow_nil => true, :allow_blank => true
  validates_format_of :last_name, :with => /\A(?=.{2,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z]+(?<![_.])\z/, :allow_nil => true, :allow_blank => true
 def admin?
   role == 'admin'
 end
end
