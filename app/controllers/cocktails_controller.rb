class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end


 # GET index
 #    assigns all cocktails as @cocktails (FAILED - 1)
 #  GET show
 #    assigns the requested cocktail as @cocktail (FAILED - 2)
 #  GET new
 #    assigns a new cocktail as @cocktail (FAILED - 3)
 #  POST create
 #    with valid params
 #      creates a new Cocktail (FAILED - 4)
 #      assigns a newly created cocktail as @cocktail (FAILED - 5)
 #      redirects to the created cocktail (FAILED - 6)
 #    with invalid params
 #      assigns a newly created but unsaved cocktail as @cocktail (FAILED - 7)
 #      re-renders the 'new' template (FAILED - 8)
