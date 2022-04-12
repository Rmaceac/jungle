class User < ActiveRecord::Base

  has_secure_password

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 8 }
  validates :email, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    email_str = email.strip
    
    user = self.find_by_email(email_str)
    

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
  

end
