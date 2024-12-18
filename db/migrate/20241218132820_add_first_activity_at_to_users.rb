class AddFirstActivityAtToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :first_activity_at, :datetime
  end
end
