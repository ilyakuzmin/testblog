class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :posts

  before_create :set_as_admin
  after_create :send_welcome_email

  private

  def set_as_admin
    self.admin = true if User.count.zero?
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
