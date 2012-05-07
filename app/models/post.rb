class Post < ActiveRecord::Base
  acts_as_taggable

  attr_accessible :title, :body, :category_id, :tag_list

  belongs_to :category

  validates :category_id, :title, :body, :presence => true

  scope :order_by_created_at, lambda {|direction| order("created_at #{direction == 'desc' ? 'DESC' : 'ASC'}")}
  scope :containing_text, lambda {|text| where("title LIKE ? OR body LIKE ?", "%#{text}%", "%#{text}%")}

end
