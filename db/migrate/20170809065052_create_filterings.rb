class CreateFilterings < ActiveRecord::Migration[5.1]
  def change
    create_table :filterings do |t|
      t.references :user, foreign_key: true
      t.string :service_provider
      t.string :degree
      t.integer :price

      t.timestamps
    end
  end
end
