class AddDoctorableIdAndDoctorableTypeToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :doctorable_id, :integer
    add_column :doctors, :doctorable_type, :integer
  end
end
