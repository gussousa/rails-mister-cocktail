class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show edit update destroy]

  def index
    @cocktails = Cocktail.all
    params[:search] = capitalize_name(params[:search]) unless params[:search].nil?
    return if params[:search].nil?

    @filter_cocktails = Cocktail.where("name like '%#{params[:search]}%'")
    @filter_ingredients = Cocktail.joins(:ingredients)
                                  .where(ingredients: { name: params[:search] })
  end

  def show
    @doses = Dose.where(cocktail_id: @cocktail.id)
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all
  end

  def create
    cocktail = Cocktail.new(cocktail_params)
    cocktail.save

    redirect_to cocktail_path(cocktail)
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)

    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy

    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params[:cocktail][:name] = capitalize_name(params[:cocktail][:name])
    params.require(:cocktail).permit(:name, :img_url)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def capitalize_name(name)
    if name.split(' ').size.positive?
      up_cap_name = name.split.each(&:capitalize!)
      up_cap_name = up_cap_name.join(' ')
    else
      up_cap_name = name.capitalize!
    end
    up_cap_name
  end
end
