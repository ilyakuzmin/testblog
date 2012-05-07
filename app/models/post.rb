class Post < ActiveRecord::Base
  acts_as_taggable

  attr_accessible :title, :body, :category_id, :tag_list

  belongs_to :category

  validates :category_id, :title, :body, :presence => true
end
