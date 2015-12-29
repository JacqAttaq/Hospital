task create_fcbase: :environment do

  100.times do
    a = Facility.create!({
      name: Faker::Company.name,
      address: Faker::Address.street_address,
      zip: Faker::Address.zip
    })
    15.times do
      a.patients.create!({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        d_o_b: Faker::Date.between(80.years.ago, 10.years.ago),
        description: Faker::Lorem.paragraph,
        gender: ["male", "female"].sample,
        blood_type: [
           "A-",
           "A+",
           "B-",
           "B+",
           "AB-",
           "AB+",
           "O-",
           "O+"
          ].sample,
        })
      end
    end
  puts "100 facilities with 15 patients created"
end