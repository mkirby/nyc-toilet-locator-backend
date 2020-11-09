class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :date, :name
  has_one :toilet
end
