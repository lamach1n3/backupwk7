class CreateFactElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.string :SerialNumber
      t.date :Date_Commissioning
      t.integer :BuildingId
      t.integer :CustomerId
      t.string :Building_City

      t.timestamps
    end
  end
end
