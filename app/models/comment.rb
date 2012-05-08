class Comment < ActiveRecord::Base
  attr_accessible :body, :user_email

  belongs_to :user
  belongs_to :post

end
