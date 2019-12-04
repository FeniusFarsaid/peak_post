class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.new(params[:user])
        if @user.save
            session['user_id'] = @user.id
            redirect '/user_profile'
        else 
            redirect '/signup'
        end
    end

    get '/user_profile' do
        if !logged_in?
            redirect '/'
        else
            @user = current_user
            @ascents = @user.ascents
            #binding.pry
            erb :'users/user_profile'
        end
    end
end