require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  
  get '/recipes' do 
    # binding.pry
    @recipes = Recipe.all
    erb :index
  end 
  
  get '/recipes/:id' do 
    @recipe = Recipe.find_by(params[:id])
    erb :show
  end 
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(params[:id])
    erb :edit 
  end 
  
  get '/recipes/new'
    erb :new 
  end 
  
  patch '/recipes/:id/edit' do 
    @recipe = Recipe.find_by(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
  end 
  
  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete 
    redirect to '/recipes'
  end 

end

