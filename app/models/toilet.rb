class Toilet < ApplicationRecord
    has_many :reviews
    geocoded_by :locationAddress
    reverse_geocoded_by :latitude, :longitude
    include PgSearch::Model
    default_scope {order('id ASC')}

    def locationAddress
        self.address
    end

    pg_search_scope :search, against: [
        :borough,
        :neighborhood
    ]
end
