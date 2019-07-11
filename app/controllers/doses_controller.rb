class DosesController < ApplicationController
  # def new
  #   @dose = Dose.new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  # end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    return redirect_to @cocktail if @dose.destroy

    render 'cocktails/show'
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
