FactoryGirl.define do
  factory :story do
    sequence(:title) { |n| "title #{n}" }
    sequence(:description) { |n| "description #{n}" }
    tag_list 'dhaka, old town'
  end
end