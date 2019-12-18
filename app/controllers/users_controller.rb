class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.new(params[:user])
        if @user.save
            session['user_id'] = @user.id
            redirect '/ascents'
        else 
            flash[:message] = "Error: That username is already taken or the email is already registered to another account."
            redirect '/signup'
        end
    end
end