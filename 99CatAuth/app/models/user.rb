class User < ActiveRecord::Base

  before_validation :ensure_session_key
  validates :username, :session_token, :password_digest, presence: true, uniqueness: true


  attr_reader :password



  def self.find_by_credentials(user_name, password)
    user = User.find_by_username(user_name)
    return user if user && user.is_password?(password)
    nil
  end

  def ensure_session_key
    self.session_token ||= SecureRandom.base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.base64
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
