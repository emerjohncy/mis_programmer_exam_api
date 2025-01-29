class SimplifiedPositionSerializer < ActiveModel::Serializer
  attributes :position_title, :salary

  def salary
    "%.2f" % object.salary.to_f
  end
end
