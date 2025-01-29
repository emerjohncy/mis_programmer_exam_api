class CreatePositions < ActiveRecord::Migration[7.2]
  def change
    create_table :positions do |t|
      t.string :position_title
      t.decimal :salary, precision: 12, scale: 2

      t.timestamps
    end
  end
end
