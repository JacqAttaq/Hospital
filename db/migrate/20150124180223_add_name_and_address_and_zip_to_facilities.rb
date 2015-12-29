class AddNameAndAddressAndZipToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :name, :string
    add_column :facilities, :address, :string
    add_column :facilities, :zip, :integer
  end
end
