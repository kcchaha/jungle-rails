class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  validates :password, length: { minimum: 8 }

  def authenticate_with_credentials(email, password)
    user = User.find_by_email email
    if user && user.authenticate(password)
      return @user
    else
      return false
    end
  end 
end
