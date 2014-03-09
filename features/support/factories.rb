require 'factory_girl'

FactoryGirl.define do
  factory :user do |f|
    f.username 'John Smith'
  end

  factory :message do |f|
    f.content 'Test messsage content'
    f.user :user
  end
end