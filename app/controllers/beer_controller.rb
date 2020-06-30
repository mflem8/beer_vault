class BeerController < ApplicationController

  get '/beers' do
    @beers = Beer.all
    erb :'beers/index'
  end

  get '/beers/:id' do
    @beer = Beer.find_by_id(params[:id])

    if @beer
      erb :'/beers/show'
    else
      redirect '/beers'
    end
  end
end
