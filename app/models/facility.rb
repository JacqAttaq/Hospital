class Facility < ActiveRecord::Base
  has_many :patients, dependent: :destroy
  has_many :meds
  has_many :doctors, as: :doctorable

  SPECIALTIES = [
    "Allergy",
    "Oncology",
    "Endocronologist",
    "Emergeny",
    "Intensive Care",
    "Podiatry",
    "Geriatrics",
    "Surgery"
  ]
end
