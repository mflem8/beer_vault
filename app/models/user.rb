class User < ActiveRecord::Base
  has_many :beers
  has_secure_password
  validates :email, :username, uniqueness: true

end
