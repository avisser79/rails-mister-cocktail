class DosesController < ApplicationController
  #  def index
  #   @doses = Dose.all
  # end

  # def show
  #   @dose = Dose.find(params[:id])
  # end
  before_action :set_cocktail

  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  # def update
  # end

  # def edit
  # end

  def destroy
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def dose_params
      params.require(:dose).permit(:description, :ingredient)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
