class User < ActiveRecord::Base
  has_many :tweets
  validates_uniqueness_of :email
  has_secure_password

  after_create :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end
end
