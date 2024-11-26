class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.date :date_of_birth
      t.string :gender
      t.text :address
      t.integer :created_by

      t.timestamps
    end
  end
end
