task create_med: :environment do
  15.times do
    new_med = Med.create!({
      name:  ["Accupril",
      "Acetaminophen",
      "Ambien",
      "Mefoxin",
      "Mycelex",
      "Zanaflex",
      "Zyrtec",
      "Sonata",
      "Stadol",
      "Kineret",
      "Penicillin",
      "Ibuprofen"
      ].sample,
      dose: [5,10,40,100,250,500].sample,
      description: Faker::Lorem.words(5,true)
      })
  end
  puts "15 medications created"
end