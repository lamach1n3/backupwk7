class CreateFactQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_quotes do |t|
      t.integer :QuoteId
      t.date :Creation
      t.string :Company_Name
      t.string :Email
      t.integer :NbElevator

      t.timestamps
    end
  end
end
