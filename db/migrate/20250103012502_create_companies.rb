class CreateCompanies < ActiveRecord::Migration[7.2]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :company_email
      t.string :company_address
      
      t.timestamps
    end
  end
end
