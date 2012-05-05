class Post < ActiveRecord::Base
  attr_accessible :body, :category_id, :title, :user_id
end
