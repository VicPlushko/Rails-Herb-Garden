class HerbsController < ApplicationController
    
    def new
        @herb = Herb.new
    end

    def create
        @herb = Herb.create(herb_params)
    end

    def show
        @herb = Herb.find_by_id(params[:id])
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
