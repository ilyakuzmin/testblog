class Comment < ActiveRecord::Base
  include AASM

  attr_accessible :body, :user_email

  validates :body, :present => true
  validate :user_or_user_email_presence

  belongs_to :user
  belongs_to :post

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

  private

  def user_or_user_email_presence
    unless user_id.present? && user_email.present?
      errors[:base] << "User should be present!"
    end
  end
end
