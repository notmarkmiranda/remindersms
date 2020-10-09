class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: true}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable
end
