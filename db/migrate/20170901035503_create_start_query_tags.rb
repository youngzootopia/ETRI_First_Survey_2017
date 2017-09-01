class CreateStartQueryTags < ActiveRecord::Migration[5.1]
  def change
    create_table :start_query_tags do |t|
      t.references :start_query, foreign_key: true
      t.references :shot, foreign_key: true
      t.string :tag_desc
      t.integer :tag_id
      t.integer :tag_score

      t.timestamps
    end
  end
end
