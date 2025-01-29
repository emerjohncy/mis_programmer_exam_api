class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :employee_number, :full_name, :first_name, :middle_name, :last_name, :position, :created_at, :updated_at
  
  belongs_to :position, serializer: PositionSerializer
  has_one :company, serializer: CompanySerializer

  def full_name
    # Concatenate first, middle, and last names with spaces
    [object.first_name, object.middle_name, object.last_name].reject(&:blank?).join(' ')
  end
end
