class SessionsController < ApplicationController

    get '/login' do
        #redirect_if_logged_in(session)
        erb :'sessions/login'
    end

    post '/login' do 
        #params(username, password, email)
        #check to see if user.email exists
        #if user exists, authenticate pw
        #redirect accordingly (if yes, peaks, if no, login)

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