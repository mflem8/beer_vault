class Beer < ActiveRecord::Base
  belongs_to :user
  validates :name, :style, :rating, presence: true

end
