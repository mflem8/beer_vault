class User < ActiveRecord::Base
  has_many :beers
  has_secure_password
  validates :email, uniqueness: true

end
