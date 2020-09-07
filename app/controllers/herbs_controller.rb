class HerbsController < ApplicationController

    def show
        @herb = Herb.find_by_id(params[:id])
    end
end
