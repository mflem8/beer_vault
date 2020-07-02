class SessionsController < ApplicationController

  get '/sign_in' do
    erb :"sessions/sign_in"
  end

  post '/sign_in' do
    @current_user = User.find_by(username: params[:username])
    if @current_user && current_user.authenticate(params[:password])
      session[:user_id] = @current_user.id
      redirect '/beers'
    else
      redirect '/sign_up'
    end
  end

  get '/sign_out' do
    if logged_in?
      session[:user_id] = nil
      redirect to '/'
    else
      redirect to '/'
    end
  end
  
end
