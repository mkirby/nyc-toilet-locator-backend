class Api::V1::ToiletsController < ApplicationController

    def show
        toilet = Toilet.find(params[:id])
        render json: toilet
    end

    def index
        toilets = Toilet.all 
        render json: toilets
    end

end
