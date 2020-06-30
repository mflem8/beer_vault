class BeerController < ApplicationController

  get '/beers' do
    @beers = Beer.all
    erb :'beers/index'
  end

  get '/beers/new' do
    @users = User.all
    erb :'/beers/new'
  end

  post '/beers' do
    user = User.find_by_id(params[:user_id])
    beer = user.beers.build(params)
    if beer.save
      redirect '/beers'
    else
      redirect '/beers/new'
    end
  end

  get '/beers/:id' do
    @beer = Beer.find_by_id(params[:id])

    if @beer
      erb :'/beers/show'
    else
      redirect '/beers'
    end
  end

  get '/beers/:id/edit' do
    @beer = Beer.find_by_id(params[:id])
    erb :'/beers/edit'
  end

  patch '/beers/:id' do
    beer = Beer.find_by_id(params[:id])
    if beer.update(name: params[:name], style: params[:style], rating: params[:rating])
      redirect "/beers/#{beer.id}"
    else
      redirect "/beers/#{beer}/edit"
    end
  end

  delete '/beers/:id' do
    beer = Beer.find_by_id(params[:id])
    if beer
      beer.delete
    end
    redirect '/beers'
  end
end
