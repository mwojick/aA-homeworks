# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password        :string
#

class User < ApplicationRecord
  attr_reader :password

  validates :username, :session_token, presence: true, uniqueness: true
  validates_presence_of :password_digest, message: "Password can\'t be blank"
  validates :password, length: {minimum: 6}, allow_nil: true

  before_validation :ensure_session_token

  def find_by_credentials(name, pw)
    user = User.find_by(username: name)
    if user && BCrypt::Password.new(user.password_digest).is_password?(pw)
      return user
    end
    nil
  end

  def generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.generate_session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

end
