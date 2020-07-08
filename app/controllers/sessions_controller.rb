class SessionsController < ApplicationController

  get '/sign_in' do
    erb :"sessions/sign_in"
  end

  post '/sign_in' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/beers/index'
    else
      redirect '/sign_in'
    end
  end

  get '/sign_out' do
    session.clear
    redirect '/sign_in'
  end
end
