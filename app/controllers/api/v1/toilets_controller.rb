class Api::V1::ToiletsController < ApplicationController

    def show
        toilet = Toilet.find(params[:id])
        render json: toilet
    end
    require "byebug"
    def index
        if params[:query]
            toilets = Toilet.search(params[:query])
            neighborhoods = toilets.map{|toilet| toilet.neighborhood}.uniq.sort
            toilets = toilets.paginate(page: params[:page], per_page: 8)
            manualReviews = toilets.map{ |toilet| toilet.reviews}
        else
            toilets = Toilet.paginate(page: params[:page], per_page: 8)
            neighborhoods = Toilet.all.map{|toilet| toilet.neighborhood}.uniq.sort
            manualReviews = toilets.map{ |toilet| toilet.reviews}
        end
        lastPage = toilets.total_pages

        render json: {toilets: toilets, lastPage: lastPage, neighborhoods: neighborhoods, reviews3: manualReviews}
        
    end

    def create
        toilet = Toilet.create(toiletParams)
        render json: toilet
    end
    
    def update
        toilet = Toilet.find(params[:id])
        toilet.update(toiletParams)
        render json: toilet
    end

    private

    def toiletParams
        params.require(:toilet).permit(:name, :location, :open_year_round, :handicap_accessible, :borough, :likes, :latitude, :longitude, :address, :neighborhood, :image)
    end

end
