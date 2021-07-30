FactoryBot.define do
  factory :course do
    name { "Test Course" }
    association :coach
    # activities { [association(:activity)] }
    self_assignable { false }
  end
end
