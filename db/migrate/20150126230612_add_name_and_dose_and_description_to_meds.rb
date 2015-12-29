class AddNameAndDoseAndDescriptionToMeds < ActiveRecord::Migration
  def change
    add_column :meds, :name, :string
    add_column :meds, :dose, :string
    add_column :meds, :description, :string
  end
end
