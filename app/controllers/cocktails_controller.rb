class CocktailsController < ApplicationController

  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @cocktails = Cocktail.all
  end

  def showend

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktails_path
    else
      render :edit
    end
  end

  def destroy
    @cocktail.delete
    redirect_to root_path
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :description)
  end
end



