class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.integer :number_of_apartments
      t.integer :number_of_floors
      t.integer :number_of_basements
      t.integer :number_of_companies
      t.integer :number_of_floors
      t.integer :number_of_basements
      t.integer :number_of_parking
      t.integer :number_of_elevators
      t.integer :maximum_occupancy
      t.integer :business_hours
      t.string :company_name
      t.text :product_line
      t.decimal :install_fees
      t.decimal :total_price
      t.decimal :unit_price
      t.string :building_type
      t.timestamp :date

      t.timestamps
    end
  end
end
