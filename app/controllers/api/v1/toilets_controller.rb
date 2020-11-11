class Api::V1::ToiletsController < ApplicationController

    def show
        toilet = Toilet.find(params[:id])
        render json: toilet
    end

    def index
        if params[:query]
            toilets = Toilet.search(params[:query])
            neighborhoods = toilets.map{|toilet| toilet.neighborhood}.uniq.sort
            toilets = toilets.paginate(page: params[:page], per_page: 8)
            lastPage = (Toilet.search(params[:query]).count / 8.to_f).ceil
        else
            toilets = Toilet.paginate(page: params[:page], per_page: 8)
            neighborhoods = Toilet.all.map{|toilet| toilet.neighborhood}.uniq.sort
            lastPage = (Toilet.count / 8.to_f).ceil
        end
        render json: {toilets: toilets, lastPage: lastPage, neighborhoods: neighborhoods}
    end
end
