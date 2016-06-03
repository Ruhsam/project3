class User < ActiveRecord::Base
   VALID_EMAIL_REGEX = /\w+@[^\.]+\.\w+/
   validates :email,
            presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: true,
            length:     { maximum: 255 }
   # validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  has_many :appointments

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
