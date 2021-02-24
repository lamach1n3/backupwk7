class CreateDimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.date :Creation_Date
      t.string :Company_name
      t.string :FN_Cpy_main_ct
      t.string :Email_Cpy_man_ct
      t.integer :NbElevators
      t.string :CustomerCity

      t.timestamps
    end
  end
end
