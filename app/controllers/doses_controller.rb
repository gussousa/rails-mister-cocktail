class DosesController < ApplicationController
  before_action :set_dose, only: %i[destroy]

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    dose = Dose.new(dose_params)
    cocktail = Cocktail.find(params[:cocktail_id])
    dose.cocktail = cocktail
    dose.save

    redirect_to cocktail_path(cocktail)
  end

  def destroy
    @dose.destroy
    cocktail = @dose.cocktail

    redirect_to cocktail_path(cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
