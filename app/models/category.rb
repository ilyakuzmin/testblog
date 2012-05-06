class Category < ActiveRecord::Base
  has_ancestry

  attr_protected :ancestry

  has_many :posts
end
