class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.datetime :std
      t.datetime :etd
      t.string :airline
      t.string :flight_no
      t.string :destination
      t.string :gate
      t.string :status

      t.timestamps
    end
  end
end
