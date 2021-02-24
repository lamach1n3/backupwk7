class CreateFactContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_contacts do |t|
      t.integer :ContactId
      t.date :Creation_Date
      t.string :Company_name
      t.string :Email
      t.string :Project_Name

      t.timestamps
    end
  end
end
