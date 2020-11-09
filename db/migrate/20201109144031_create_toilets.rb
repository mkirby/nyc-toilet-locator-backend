class CreateToilets < ActiveRecord::Migration[6.0]
  def change
    create_table :toilets do |t|
      t.string :name
      t.string :location
      t.string :open_year_round
      t.string :borough

      t.timestamps
    end
  end
end
