require "./config/environment"
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    # binding.pry
    erb :index
  end

  helpers do
    def current_user
			@current_user ||= User.find_by_id(session[:user_id])
		end

    def logged_in?
			!!current_user
		end
  end


end
