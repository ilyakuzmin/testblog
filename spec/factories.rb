FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password              '123456'
    password_confirmation '123456'
  end

  factory :comment do
    association :post
    body        'Comment body'
    user_email  'guest@example.com'
  end

  factory :post do
    association :user
    association :category
    title       'Post title'
    body        'Post body'
  end

  factory :category do
    name 'Category 1'
  end
end