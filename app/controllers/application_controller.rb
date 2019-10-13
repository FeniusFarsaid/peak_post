require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get '/users/signup' do
    #redirect_if_logged_in(session)
    erb :'users/signup'
  end

end

#many to many (users have peaks through ascents and peaks have users though ascents.)
