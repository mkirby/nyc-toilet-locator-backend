class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :date, :name, :rating, :toilet_id
end
