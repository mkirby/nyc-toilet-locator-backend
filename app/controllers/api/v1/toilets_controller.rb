class Api::V1::ToiletsController < ApplicationController

    def show
        toilet = Toilet.find(params[:id])
        render json: toilet
    end

    def index
        toilets = Toilet.paginate(page: params[:page], per_page: 8)
        render json: toilets
    end

end
