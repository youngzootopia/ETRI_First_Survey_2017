class CreateStartQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :start_queries do |t|
      t.references :user, foreign_key: true
      t.string :query

      t.timestamps
    end
  end
end
