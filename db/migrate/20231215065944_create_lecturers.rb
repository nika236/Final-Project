class CreateLecturers < ActiveRecord::Migration[7.1]
  def change
    create_table :lecturers do |t|
      t.string :name, null:false
      t.datetime :start_date, null:false
      t.datetime :end_date, null:false
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
