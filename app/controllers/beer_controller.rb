class BeerController < ApplicationController

  get '/beers' do
    if logged_in?
      @beers = current_user.beers
      erb :'beers/index'
    else
      redirect '/login'
  end

  get '/beers/new' do
    if logged_in?
      erb :'/beers/new'
    else
      redirect '/login'
  end

  post '/beers' do
    if logged_in?
      beer = current_user.beers.build(params)
      if beer.save
        redirect '/beers'
      else
        redirect '/beers/new'
      end
    else
      redirect '/login'
    end
  end

  get '/beers/:id' do
    if logged_in?
      @beer = current_user.beers.find_by_id(params[:id])
      if @beer
        erb :'/beers/show'
      else
        redirect '/beers'
      end
    else
      redirect '/login'
    end
  end

  get '/beers/:id/edit' do
      if logged_in?
        @beer = current_user.beers.find_by_id(params[:id])
        if @beer
          erb :'/beers/edit'
        else
          redirect '/beers'
        end
      else
        redirect '/login'
      end
  end

  patch '/beers/:id' do
    if logged_in?
      beer = current_user.beers.find_by_id(params[:id])
      if beer
        if beer.update(name: params[:name], style: params[:style], rating: params[:rating])
          redirect "/beers/#{beer.id}"
        else
          redirect "/beers/#{beer}/edit"
        end
      else
        redirect '/beers'
      end
    else
      redirect '/login'
    end
  end


delete '/beers/:id' do
        if logged_in?
            beer = Beer.find_by_id(params[:id])
            if beer
                beer.delete
            end
            redirect '/beers'
        else
            redirect '/login'
          end
        end
      end
  end
end
