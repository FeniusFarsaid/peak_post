require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "super_secret_password"
  end

  get "/" do
    @peaks = Peak.all
    @users = User.all
    erb :welcome
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
        if logged_in?
          User.find_by(id: session[:user_id])
        else
            nil
        end
    end 

    def login(email, password)
        @user = User.find_by[:email => email] 
        if @user && @user.authenticate(password)
          session[:email] = user.email 
        else
          redirect '/login'
        end
    end 

    def logout!
      session.clear
    end

  end  
end

#many to many (users have peaks through ascents and peaks have users though ascents.)
