require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    if logged_in?
      erb :'users/home'
    else
      erb :'homepage'
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/"
      end
    end

    def redirect_if_logged_in
      if logged_in?
        redirect '/users/home'
      end
    end

    def redirect_if_not_users_app
      if current_user != @application.user
        redirect '/applications'
      end
    end
  end
  
end
