class Toilet < ApplicationRecord
    has_many :reviews
    geocoded_by :location
    reverse_geocoded_by :latitude, :longitude

    def location
        self.address
    end

end
