FactoryGirl.define do
  factory :facility do
    name "MUSC"
    address "Charleston"
    zip "29400"
  end

  factory :patient do
    first_name "Alice"
    last_name "Cooper"
    d_o_b "1999-01-02"
    description "Heart Attack"
    gender "Female"
    blood_type "A+"
  end

  factory :med do
    name "Morphine"
    dose "30 mg"
    description "Painkiller"
  end

  factory :doctor do
    name "Dr. Danny Castellano"
    specialty "Ob/gyn"
  end

  factory :facility_with_patients do
    transient do
      patient_count 3
    end
  end
end