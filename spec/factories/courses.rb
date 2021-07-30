FactoryBot.define do
  factory :course do
    name { Faker::Name.name }
    association :coach
    # activities { [association(:activity)] }
    self_assignable { false }
  end
end
