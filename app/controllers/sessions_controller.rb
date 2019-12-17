class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do 
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session['user_id'] = @user.id
            redirect '/ascents'
        else
            redirect '/login'
        end
    end

    post '/logout' do
        if logged_in?
          session.clear
          redirect '/'
        end
    end
end 