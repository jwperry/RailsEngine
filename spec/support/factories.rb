FactoryGirl.define do

  factory :merchant do
    name
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
end
