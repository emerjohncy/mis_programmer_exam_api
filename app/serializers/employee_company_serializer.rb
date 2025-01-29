class EmployeeCompanySerializer < ActiveModel::Serializer
  attributes :id, :employee, :company

  belongs_to :employee, serializer: SimplifiedEmployeeCompanySerializer
  belongs_to :company, serializer: SimplifiedCompanySerializer
end
