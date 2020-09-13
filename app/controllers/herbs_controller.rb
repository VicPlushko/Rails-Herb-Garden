class HerbsController < ApplicationController

    def index
        @herbs = Herb.all
    end
    
    def new
        @herb = Herb.new
    end

    def create
        @herb = Herb.create(herb_params)
        redirect_to herb_path(@herb)
    end

    def show
        @herb = Herb.find_by_id(params[:id])
    end

    def edit
        @herb = Herb.find_by_id(params[:id])
    end

    def update
        @herb = Herb.find_by_id(params[:id])
        @herb.update(herb_params)
        redirect_to home_path
    end

    def destroy
        @herb = Herb.find_by_id(params[:id])
        @herb.destroy
        redirect_to home_path
    end

    private

    def herb_params
        params.require(:herb).permit(
            :name,
            :latin_name,
            :family,
            :medicinal_parts,
            :taste,
            :energetics,
            :action,
            :ideal_for,
            :application,
            :dosage,
            :considerations
        )
    end
end
