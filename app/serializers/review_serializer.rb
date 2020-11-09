class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :date, :name
end
