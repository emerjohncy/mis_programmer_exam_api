class PositionSerializer < ActiveModel::Serializer
  attributes :id, :position_title, :salary

  def salary
    "%.2f" % object.salary.to_f
  end
end
