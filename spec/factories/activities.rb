FactoryBot.define do
  factory :activity do
    name {"Test activity"}
    association :course
  end
end
