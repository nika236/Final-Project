class CreateQuestionnaires < ActiveRecord::Migration[7.1]
  def change
    create_table :questionnaires do |t|
      t.string :question, null:false
      t.text :answer

      t.timestamps
    end
  end
end
