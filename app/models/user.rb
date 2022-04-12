class User < ActiveRecord::Base

  has_secure_password

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 8 }
  validates :email, uniqueness: { case_sensitive: false }

  def authenticate_with_credentials
    
  end
  

end
