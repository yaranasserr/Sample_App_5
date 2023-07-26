class AddActivatedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :activated, :boolean
    add_column :users, :default, :string
    add_column :users, :false, :string
  end
end
