task create_doc: :environment do
  100.times do 
    new_doctor = Doctor.create!({
      name: Faker::Name.last_name,
      specialty: [
        "Hand",
        "Foot",
        "Knees",
        "Skin",
        "Bones",
        "Blood",
        "Muscles",
        "Brain",
        "Heart",
        "Lungs",
        "Feelings"
        ].sample,
      doctorable_id: Faker::Number.between(1,100),
      doctorable_type: [
        "Facility",
        "Patient"
        ].sample,
    })
   
  end
  puts "100 Doctors created"
end