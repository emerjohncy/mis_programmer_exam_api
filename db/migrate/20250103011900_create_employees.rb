class CreateEmployees < ActiveRecord::Migration[7.2]
  def change
    create_table :employees do |t|
      t.integer :employee_number
      t.string :first_name
      t.string :last_name
      t.string :middle_name

      t.timestamps
    end
  end
end
