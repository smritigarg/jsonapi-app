FactoryBot.define do
  factory :coach do
    name { Faker::Name.name }
    # factory :coach_with_courses do
    #   courses { [association(:course)] }
    # end
  end
end
