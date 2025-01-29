class EmployeeCompany < ApplicationRecord
  validates :employee_id, presence: true, uniqueness: true
  validates :company_id, presence: true
  
  belongs_to :employee
  belongs_to :company
end
