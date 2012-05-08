class Post < ActiveRecord::Base
  acts_as_taggable

  attr_accessible :title, :body, :category_id, :tag_list

  belongs_to :category
  belongs_to :user
  has_many :comments

  validates :category_id, :title, :body, :user_id, :presence => true

  scope :order_by_created_at, lambda {|direction| order("posts.created_at #{direction == 'desc' ? 'DESC' : 'ASC'}") }
  scope :containing_text, lambda {|text| where("posts.title LIKE ? OR posts.body LIKE ?", "%#{text}%", "%#{text}%") if text }
  scope :with_category_id, lambda {|category_id| where("posts.category_id = ?", category_id) if category_id }
  scope :with_tags, lambda {|tags| tagged_with(tags.split(",")) if tags.present? }

end
