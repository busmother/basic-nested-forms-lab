class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "Ingredient 1")
    @recipe.ingredients.build(name: 'ingredient_2')
  end

  def create
    # byebug
    @recipe = Recipe.create(recipe_params)
    # @recipe.ingredients.each do |ingredient|
    #   Ingredient.create(name: ingredient.name, quantity: ingredient.quantity)
    # end
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )
  end
end
