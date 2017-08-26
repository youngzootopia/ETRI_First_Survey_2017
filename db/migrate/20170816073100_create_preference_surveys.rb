class CreatePreferenceSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :preference_surveys do |t|
      t.references :user, foreign_key: true
      t.references :media, foreign_key: true
      t.references :shot, foreign_key: true
      t.string :program_name
      t.float :preference
      t.string :reason

      t.timestamps
    end
  end
end
