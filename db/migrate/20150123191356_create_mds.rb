class CreateMds < ActiveRecord::Migration
  def change
    create_table :mds do |t|

      t.timestamps null: false
    end
  end
end
