class UsersController < ApplicationController

  get '/sign_up' do
    if logged_in?
      redirect to '/beers'
    else
      erb :'/users/sign_up'
    end
  end

  post '/sign_up' do
    if params[:name] != "" && params[:username] != "" && params[:password] !=""
      @new_user = User.new(:name => params[:name], :username => params[:username], :password => params[:password])
      @new_user.save
      session[:user_id]= @new_user.id
      redirect to '/beers'
    else
      redirect to '/sign_up'
    end
  end

  get '/sign_in' do
    if logged_in?
      redirect to '/beers'
    else
      erb :'/users/sign_in'
    end
  end

  post '/sign_in' do
    @current_user = User.find_by(:username => params[:username])

    if @current_user && current_user.authenticate(params[:password])
      session[:user_id] = @current_user.id
      redirect to '/beers'
    else
      redirect to '/sign_up'
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
