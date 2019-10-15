class UsersController < ApplicationController

    get '/signup' do
        erb :'signup'
    end

    post '/signup' do
        @user = User.new
        @user.name = params[:name]
        @user.email = params[:email]
        @user.passwor = params[:password]
        if @user.save
            redirect '/login'
        else 
        erb :'peaks'
        end
    end

    get '/login' do
        #redirect_if_logged_in(session)
        erb :'login'
    end

    post '/login' do 

    end

end