class HerbsController < ApplicationController

    def index
        @herbs = Herb.all.order('name ASC')
        if params[:search] && params[:search].length >= 3
            @herbs = Herb.search(params[:search]).order('name ASC')
        elsif params[:search] && params[:search].length < 3
            flash.now[:search_error] = "Search must be more than 3 characters"
            @herbs = Herb.all.order('name ASC')
        else
        @herbs = Herb.all.order('name ASC')
        end  
        render 'index'
    end
    
    def new
        @herb = Herb.new
    end

    def create
         @herb = Herb.new(herb_params)
         if @herb.save
           redirect_to herb_path(@herb)
        else
            flash[:herb_not_created] = "Please make sure all fields are filled in"
            render :new
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
