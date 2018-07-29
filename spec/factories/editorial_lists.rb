FactoryBot.define do
  factory :editorial_list do
    sequence(:title) {|n| "Editorial List#{n}" }
    sequence(:about) {|n| "About Editorial List#{n}" }
    sequence(:slug) {|n| "editorial-list#{n}" }
  end
end
