class SpicesController < ApplicationController
    before_action :find_spice, only: [:update, :destroy]
    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: 201
    end

    def update
        spice = Spice.find(params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: {error: "Not found"}, status: :not_found
        end
    end

    def destroy
        spice = Spice.find(params[:id])
        if spice
            spice.destroy
            head :no_content
        else
            render json: {error: "Not found"}, status: :not_found
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating )
    end

    def find_spice
        spice = Spice.find(params[:id])
    end

end
