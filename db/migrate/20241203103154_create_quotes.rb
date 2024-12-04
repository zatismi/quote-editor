class CreateQuotes < ActiveRecord::Migration[8.0]
  def change
    create_table :quotes do |t|
      # constraint: ensure we will never store quotes with an empty name in the database even if we made a mistake in the console
      t.string :name, null: false

      t.timestamps
    end
  end
end
