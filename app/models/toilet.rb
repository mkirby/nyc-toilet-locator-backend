class Toilet < ApplicationRecord
    has_many :reviews
    geocoded_by :locationAddress
    reverse_geocoded_by :latitude, :longitude

    def locationAddress
        self.address
    end


end
