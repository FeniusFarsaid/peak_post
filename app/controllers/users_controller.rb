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
        @user = current_user
        erb :'users/user_profile'
    end

    

end