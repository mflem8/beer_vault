class UsersController < ApplicationController

  get '/sign_up' do
    erb :'users/new'
  end

  post '/sign_up' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect '/beers/new'
    else
      redirect '/sign_up'
    end
  end

end
