task create_patient: :environment do |variable|
  15.times do
    new_patient = Patient.create!({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      d_o_b: Faker::Date.between(80.years.ago, Date.today),
      description: Faker::Lorem.paragraph,
      gender: Faker::Lorem.word,
      blood_type: Faker::Lorem.word,
      })
  end
end