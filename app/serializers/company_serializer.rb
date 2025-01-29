class CompanySerializer < ActiveModel::Serializer
  attributes :id, :company_name, :company_address, :company_email
end
