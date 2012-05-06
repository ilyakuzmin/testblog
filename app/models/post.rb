class Post < ActiveRecord::Base
  attr_accessible :title, :body, :category_id

  belongs_to :category

  validates :category_id, :title, :body, :presence => true
end
