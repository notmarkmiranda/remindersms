class User < ApplicationRecord
  SECRET_KEY = Rails.application.credentials.secret_key_base.to_s

  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: true}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable

  has_many :groups
  has_many :recipients

  def token
    encode(user_id: id)
  end

  private

  def encode(payload, expiration = 24.hours.from_now)
    payload[:expiration] = expiration.to_i
    JWT.encode(payload, SECRET_KEY)
  end
end
