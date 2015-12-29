class RemoveZipCodeFromFacilityMaodel < ActiveRecord::Migration
  def change
    remove_column :facilities, :zip, :integer
    add_column :facilities, :zip, :string
  end
end
