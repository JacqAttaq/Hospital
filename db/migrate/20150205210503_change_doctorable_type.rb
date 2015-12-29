class ChangeDoctorableType < ActiveRecord::Migration
  def change
    change_column :doctors, :doctorable_type, :string
  end
end
