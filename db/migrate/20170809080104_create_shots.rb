class CreateShots < ActiveRecord::Migration[5.1]
  def change
    create_table :shots, :options => "auto_increment = 0" do |t|
      t.references :media, foreign_key: true
      t.integer :shot_num
      t.integer :start_frame
      t.integer :end_frame
      t.string :start_thumb
      t.string :end_thumb
      t.string :start_time_code
      t.string :end_time_code
    end
  end
end
