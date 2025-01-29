class Employee < ApplicationRecord
  before_create :set_employee_number
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true

  has_one :employee_company, dependent: :destroy
  has_one :company, through: :employee_company
  belongs_to :position

  scope :without_company, -> {
    left_joins(:company).where(company: { id: nil })
  }

  private

  def set_employee_number
    # Get the maximum employee_number from the employees table
    max_employee_number = Employee.maximum(:employee_number) || 0
    
    # Increment it by 1 and assign it to the employee_number attribute
    self.employee_number = max_employee_number + 1
  end
end
