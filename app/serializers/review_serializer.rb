class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :date, :name, :rating, :image
end
