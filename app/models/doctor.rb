class Doctor < ActiveRecord::Base
  belongs_to :doctorable, polymorphic: true

    SPECIALTIES =[
    "Allergy",
    "Oncology",
    "Endocronologist",
    "Emergency",
    "Intensive Care",
    "Podiatry",
    "Geriatrics",
    "Surgery"
  ]
end
