class HerbsController < ApplicationController

    def index
        @herbs = Herb.all
        @herbs = Herb.search(params[:search])
    end
    
    def new
        @herb = Herb.new
    end

    def create
         herb = Herb.create(herb_params)
         if herb.save
           redirect_to herb_path(herb)
        else
            flash[:herb_not_created] = "Please make sure all fields are filled in"
            redirect_to new_herb_path
        end
    end

    def show
        @herb = Herb.find_by_id(params[:id])
    end

    def edit
        @herb = Herb.find_by_id(params[:id])
    end

    def update
        @herb = Herb.find_by_id(params[:id])
        if @herb.update(herb_params)
           redirect_to herbs_path
        else
            flash[:herb_not_edited] = "please make sure no fields are left blank"
            render "edit"
        end
    end

    def destroy
        @herb = Herb.find_by_id(params[:id])
        @herb.destroy
        redirect_to herbs_path
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
