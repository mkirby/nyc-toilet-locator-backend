class Api::V1::ToiletsController < ApplicationController

    def show
        toilet = Toilet.find(params[:id])
        render json: toilet
    end

    def index
        if params[:query]
            toilets = Toilet.search(params[:query]).paginate(page: params[:page], per_page: 8)
            lastPage = (Toilet.search(params[:query]).count / 8.to_f).ceil
        else
            toilets = Toilet.paginate(page: params[:page], per_page: 8)
            lastPage = (Toilet.count / 8.to_f).ceil
        end
        render json: {toilets: toilets, lastPage: lastPage}
    end

    def info
        lastPage = (Toilet.count / 8.to_f).ceil
        render json: lastPage
    end

end
