class AddSpecialtyToFacilityController < ActiveRecord::Migration
  def change
    add_column :facilities, :specialty, :string
  end
end
