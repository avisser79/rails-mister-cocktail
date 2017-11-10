class DosesController < ApplicationController
   def index
    @doses = Dose.all
  end

  # def show
  #   @dose = Dose.find(params[:id])
  # end
  # before_action :set_cocktail

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @ingredients = Ingredient.all
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def show
    @doses = Dose.find(params[:id])
  end

  # def update
  # end

  # def edit
  # end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path(@dose.cocktail)
  end

  private

  def dose_params
      params.require(:dose).permit(:description, :ingredient_id) # :ingredients does not work
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
