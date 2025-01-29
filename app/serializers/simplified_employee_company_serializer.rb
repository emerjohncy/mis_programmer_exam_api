class SimplifiedEmployeeCompanySerializer < ActiveModel::Serializer
  attributes :id, :full_name

  def full_name
    # Concatenate first, middle, and last names with spaces
    [object.first_name, object.middle_name, object.last_name].reject(&:blank?).join(' ')
  end
end
