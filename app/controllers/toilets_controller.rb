class Api::V1::ToiletsController < ApplicationController

    def show
        toilet = Toilet.find(params[:id])
        render json: recipe
    end

end
