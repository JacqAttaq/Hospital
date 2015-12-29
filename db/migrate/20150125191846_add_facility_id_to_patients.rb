class AddFacilityIdToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :facility_id, :integer
  end
end
