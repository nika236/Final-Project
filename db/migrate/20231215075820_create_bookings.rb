class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user
      t.references :lecturer
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
