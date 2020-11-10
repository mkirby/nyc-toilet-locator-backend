class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :date, :name, :rating, :image, :toilet_id
end
