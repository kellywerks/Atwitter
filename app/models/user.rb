class User < ActiveRecord::Base
  has_many :tweets

  validates_uniqueness_of :email

  has_secure_password
end
