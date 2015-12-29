class Med < ActiveRecord::Base
  has_many :patient_meds
  has_many :patients, through: :patient_meds


  MED_OPTIONS = [
    "Accupril",
    # highblood pressure
    "Acetaminophen",
    # pain reliever analgesics (pain relievers) 
    # and antipyretics (fever reducers)
    "Ambien",
    # insomnia, sedative
    "Mefoxin",
    #antibiotic injection/IV
    "Mycelex",
    #anti fungal cream
    "Zanaflex",
    # skeletal muscle relaxer, MS
    "Zyrtec",
    # antihistimine, allergy
    "Sonata",
    # insomnia
    "Stadol",
    #painkiller,
    "Kineret",
    #pain reliever, arthiritis
    "Penicillin",
    #antibiotic
    "Ibuprofen",
    # pain reliever, reduce swelling
  ]
end
