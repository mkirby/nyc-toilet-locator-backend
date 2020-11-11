class AddImageToToilets < ActiveRecord::Migration[6.0]
  def change
    add_column :toilets, :image, :string
  end
end
