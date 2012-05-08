class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :posts

  before_create :set_as_admin

  private

  def set_as_admin
    self.admin = true if User.count.zero?
  end
end
