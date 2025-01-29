class Company < ApplicationRecord
  validates :company_name, presence: true, uniqueness: { case_sensitive: false }
  validates :company_email, presence: true, uniqueness: { case_sensitive: false }
  validates :company_address, presence: true

  has_many :employee_companies
  has_many :employees, through: :employee_companies
end
