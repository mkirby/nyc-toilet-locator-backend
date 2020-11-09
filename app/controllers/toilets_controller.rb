class ToiletsController < ApplicationController

    def index
        toilets = Toilet.all
        render json: toilets
    end
end
