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
    erb :edit 
  end 
  
  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete 
    redirect to '/recipes'
  end 

end

