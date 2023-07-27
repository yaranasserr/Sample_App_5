class RemoveActivationColumnsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :activationn_digest, :string
    remove_column :users, :activatedd, :boolean
    remove_column :users, :activatedd_at, :datetime
  end
end
