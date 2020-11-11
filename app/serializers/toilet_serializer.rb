class ToiletSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :open_year_round, :handicap_accessible, :borough, :likes, :latitude, :longitude, :address, :neighborhood, :image
  has_many :reviews
end