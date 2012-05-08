class Comment < ActiveRecord::Base
  include AASM

  attr_accessible :body, :user_email

  validates :body, :presence => true
  validate :user_or_user_email_presence

  belongs_to :user
  belongs_to :post

  scope :accepted_or_owner, lambda {|user_id| where("comments.state = 'accepted' OR user_id = ?", user_id)}

  aasm :column => :state do
    state :unverified, :initial => true
    state :accepted
    state :declined

    event :accept do
      transitions :to => :accepted, :from => [:unverified, :declined]
    end

    event :decline do
      transitions :to => :declined, :from => [:unverified]
    end
  end

  def change_state(new_state)
    case new_state
      when 'accept'
        self.accept!
      when 'decline'
        self.decline!
    end
  end

  def user_email
    user ? user.email : read_attribute(:user_email)
  end

  private

  def user_or_user_email_presence
    unless user_id.present? || user_email.present?
      errors[:base] << "User should be present!"
    end
  end
end
