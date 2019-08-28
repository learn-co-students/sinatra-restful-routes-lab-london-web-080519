require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  #Index
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #New
  get '/recipes/new' do
    erb :new
  end

  #Show
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #Create
  post '/recipes' do 
    if params[:recipe]
      recipe = Recipe.create(params[:recipe])
    else
      recipe = Recipe.create(params)
    end
    redirect "/recipes/#{recipe.id}"
  end

  #Edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  #Update
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect "/recipes/#{@recipe.id}"
  end

  #Destroy
  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
    redirect '/recipes'
  end


end
