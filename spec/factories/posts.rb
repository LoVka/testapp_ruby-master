FactoryBot.define do
  factory :post do
    category
    user
    sequence(:title) {|n| "Post#{n}" }
    sequence(:body) {|n| "Body#{n}" }
    sequence(:lead) {|n| "Lead of the post ##{n}" }
  end
end
