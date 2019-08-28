
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @name = params[:name]
    @ingredients = params[:ingredients]
    @cook_time = params[:cook_time]
    new_recipe = Recipe.create(name: @name, ingredients: @ingredients, cook_time: @cook_time)
    recipe_id = new_recipe.id
    # binding.pry
    redirect "/recipes/#{recipe_id}"
  end

  get '/recipes' do    
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    recipe_id = params[:id]
    @recipe = Recipe.find(recipe_id)
    erb :show
  end

  get '/recipes/:id/edit' do
    recipe_id = params[:id]
    @recipe = Recipe.find(recipe_id)
    erb :edit
  end

  patch '/recipes/:id' do
    recipe_id = params[:id]
    name = params[:name]
    ingredients = params[:ingredients]
    cook_time = params[:cook_time]
    @recipe = Recipe.find(recipe_id.to_i)
    @recipe.name = name
    @recipe.content = content
    @recipe.cook_time = cook_time
    @recipe.save
    erb :show
  end

  delete '/recipes/:id' do
    recipe_id = params[:id]
    @recipe = Recipe.find(recipe_id.to_i)
    @recipe.destroy
  end
end
