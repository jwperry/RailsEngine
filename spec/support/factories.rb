FactoryGirl.define do

  factory :merchant do
    name
    created_at
    updated_at
  end

  factory :customer do
    first_name
    last_name
    created_at
    updated_at
  end

  sequence :name do |n|
    "name#{n}"
  end

  sequence :created_at do |n|
    Time.now-(n*100)
  end

  sequence :updated_at do |n|
    Time.now-(n*50)
  end

  sequence :first_name do |n|
    "first_name#{n}"
  end

  sequence :last_name do |n|
    "last_name#{n}"
  end
end
