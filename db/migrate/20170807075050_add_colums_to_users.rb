class AddColumsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, :limit => 10
    add_column :users, :birthday, :date
    add_column :users, :sex, :string, :limit => 2
    add_column :users, :married, :boolean
    add_column :users, :children, :boolean
    add_column :users, :job, :string, :limit => 50
    add_column :users, :hobby, :string, :limit => 50
    add_column :users, :phone, :string, :limit => 15
    add_column :users, :company, :string, :limit => 50
  end
end
