class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.new(params[:user])
        
        if @user.save
            session['user_id'] = @user.id
            redirect '/peaks'
        else 
            redirect '/signup'
        end
    end

    get '/user_profile' do
        #binding.pry
        if !logged_in?
            redirect '/'
        else
            @user = current_user
            @ascents = @user.ascents
            erb :'users/user_profile'
        end
    end
end