class DosesController < ApplicationController
	before_action :retrieve_things, only: [:new, :create]

	def new
      @dose = Dose.new

	end
   
    def create
      @dose = Dose.new(dose_params)
      @dose.cocktail = @cocktail
      @dose.ingredient = @ingredient
      if @dose.save
      	redirect_to @cocktail
      else
      	render :new
      end	

    end

	def destroy
		@dose = Dose.find(params[:id])
		@dose.destroy
		redirect_to @dose.cocktail

	end

  private 
   
   def retrieve_things
    @cocktail = Cocktail.find(params[:cocktail_id])
    
  end


  def dose_params
 	params.require(:dose).permit(:description)
  end
		
		
end
