class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.references :user, foreign_key: true
      t.references :start_query, foreign_key: true
      t.integer :second_query_id
      t.integer :third_query_id
      t.integer :fourth_query_id
      t.integer :fifth_query_id
      t.float :final_score
      t.string :title
      t.integer :content_type
      t.string :mash_up_url

      t.timestamps
    end
  end
end
