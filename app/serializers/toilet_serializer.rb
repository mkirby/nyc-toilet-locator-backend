class ToiletSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :open_year_round, :borough
end
