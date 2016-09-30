class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect to '/recipients'
    end
  end

  post '/signup' do
    if @user = User.create(params)
      session[:user_id] = @user.id
      redirect to '/recipients'
    else
      redirect tp '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/recipients'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect  '/recipients'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
      session.clear
      redirect to '/login'
  end

end
