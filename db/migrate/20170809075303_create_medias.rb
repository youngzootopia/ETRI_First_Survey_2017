class CreateMedias < ActiveRecord::Migration[5.1]
  def change
    create_table :media, :options => "auto_increment = 0" do |t|
      t.string :category
      t.string :program_name
      t.string :thumbnail
      t.string :local_file
      t.datetime :register_date_time
      t.datetime :last_saved_date_time
      t.string :assigned_user
      t.string :status
      t.string :audio_file
    end
  end
end
