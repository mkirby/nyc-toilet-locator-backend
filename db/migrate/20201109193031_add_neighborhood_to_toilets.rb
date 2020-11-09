class AddNeighborhoodToToilets < ActiveRecord::Migration[6.0]
  def change
    add_column :toilets, :neighborhood, :string
  end
end
