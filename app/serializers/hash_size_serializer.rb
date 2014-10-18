class HashSizeSerializer < ActiveModel::Serializer
  attributes :id, :size, :year, :month, :day

  def year
  	object.created_at.year
  end

  def month
  	object.created_at.month
  end

  def day
  	object.created_at.day
  end
end
