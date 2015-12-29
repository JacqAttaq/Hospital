class CreateMeds < ActiveRecord::Migration
  def change
    create_table :meds do |t|

      t.timestamps null: false
    end
  end
end
