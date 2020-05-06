class ApplicationsController < ApplicationController

    get '/applications' do
        redirect_if_not_logged_in
        @user = User.find_by_id(session[:user_id])
        erb :'/applications/index'
    end

    get '/applications/new' do
        redirect_if_not_logged_in
        erb :'/applications/new'
    end

    post '/applications' do
        application = current_user.applications.build(params[:application])
        application.save
        redirect "/applications/#{application.id}"
    end

    get '/applications/:id' do
        @application = Application.find_by_id(params[:id])
        redirect_if_not_users_app
        erb :'/applications/show'
    end

    get '/applications/:id/edit' do
        @application = Application.find_by_id(params[:id])
        redirect_if_not_users_app
        erb :'/applications/edit'
    end

    patch '/applications/:id' do
        application = Application.find_by_id(params[:id])
        changes = params[:application].select {|k, v| v.length > 0}
        application.update(changes)
        redirect "/applications/#{application.id}"
    end

    delete '/applications/:id' do
        Application.find_by_id(params[:id]).destroy
        redirect '/users/home'
    end

end