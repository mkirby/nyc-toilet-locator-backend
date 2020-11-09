class ToiletSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :open_year_round, :handicap_accessible, :borough
  has_many :reviews
end
