(ENV["SEED_COACH_COUNT"] || 10).to_i.times do
  coach = Coach.create!(name: Faker::Name.name)

  (ENV["SEED_COURSE_COUNT_PER_COACH"] || 10).to_i.times do
    course = coach.courses.create!({
      name: Faker::Name.name,
      self_assignable: [true, false].sample
    })

    (ENV["SEED_ACTIVITY_PER_COURSE"] || 10).to_i.times do
      course.activities.create!(name: Faker::Name.name)
    end
  end
end
