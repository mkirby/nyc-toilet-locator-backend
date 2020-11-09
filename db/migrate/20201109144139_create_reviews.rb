class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :toilet, null: false, foreign_key: true
      t.string :content
      t.string :date
      t.string :name

      t.timestamps
    end
  end
end
