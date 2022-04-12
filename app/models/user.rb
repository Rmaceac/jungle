class User < ActiveRecord::Base

  has_secure_password

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }

end
