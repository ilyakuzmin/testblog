class Post < ActiveRecord::Base
  attr_accessible :title, :body, :category_id
end
