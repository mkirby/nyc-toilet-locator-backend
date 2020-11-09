class CreateToilets < ActiveRecord::Migration[6.0]
  def change
    create_table :toilets do |t|
      t.string :name
      t.string :location
      t.boolean :open_year_round
      t.boolean :handicap_accessible
      t.string :borough
      t.integer :likes
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
