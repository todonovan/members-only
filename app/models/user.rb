class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, uniqueness: true, length: { in: 4..20 }
  validates :email, presence: true
  validates :password, presence: true

  has_secure_password
  has_many :posts, dependent: :destroy
end
