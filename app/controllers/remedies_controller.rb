class RemediesController < ApplicationController

    def index
        @remedies = Remedy.all
    end

    def show
        @remedy = Remedy.find_by_id(params[:id])
    end

    def new
        @remedy = Remedy.new
        @remedy.remedy_herbs.build
    end

    def create
        @remedy = Remedy.new(remedy_params)
        if params[:add_ingredient]
          @remedy.ingredients.build
        elsif params[:remove_ingredient]
        else
          if @remedy.save
            flash[:notice] = "Successfully Created Remedy."
            redirect_to user_remedy_path(@remedy)
          end
        end
        render action: 'new'
      end

    def edit
        @remedy = Remedy.find_by_id[params[:id]]
    end 

    def update
        @remedy = Remedy.find_by_id(params[:id])
    if params[:add_ingredient]
    	unless params[:remedy][:remedy_herbs_attributes].blank?
	  for attribute in params[:remedy][:remedy_herbs_attributes]
	    @remedy.remedy_herbs.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
	  end
    	end
      @remedy.remedy_herbs.build
    elsif params[:remove_ingredient]
      removed_remedy_herbs = params[:remedy][:remedy_herbs_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      Remedy_herb.delete(removed_remedy_herbs)
      flash[:notice] = "Herb removed."
      for attribute in params[:remedy][:remedy_herbs_attributes]
        @remedy.remedy_herbs.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
      end
    else
      if @remedy.update_attributes(params[:remedy])
        flash[:notice] = "Successfully updated remedy."
        redirect_to user_remedy_path(@remedy)
      end
    end
    render action: 'edit'
  end

  def destroy
    @remedy = Remedy.find_by_id(params[:id])
    @remedy.destroy
    flash[:notice] = "Successfully destroyed remedy."
    redirect_to root_path
  end
end
