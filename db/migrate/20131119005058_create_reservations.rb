class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.text :email
      t.datetime :requested_date
      t.string :message
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
