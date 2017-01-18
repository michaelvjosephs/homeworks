class User < ActiveRecord::Base
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_token_session

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def self.generate_token_session
    SecureRandom::urlsafe_base64(16)
  end

  def reset_token_session!
    self.session_token = self.class.generate_token_session
    self.save!
    self.session_token
  end

  def ensure_token_session
    self.session_token ||= self.class.generate_token_session
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
