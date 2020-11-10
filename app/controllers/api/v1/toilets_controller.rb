class Api::V1::ToiletsController < ApplicationController

    def show
        toilet = Toilet.find(params[:id])
        render json: toilet
    end

    def index
    
        toilets = Toilet.paginate(page: params[:page], per_page: 8)
        render json: toilets

    end

    def info
        lastPage = (Toilet.count / 8.to_f).ceil
        render json: lastPage
    end
end
