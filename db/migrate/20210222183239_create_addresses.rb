class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :type_adress
      t.string :status
      t.string :entite
      t.string :number_street
      t.string :suite_apt
      t.string :city
      t.string :postal_code
      t.string :country
      t.text :notes

      t.timestamps
    end
  end
end
