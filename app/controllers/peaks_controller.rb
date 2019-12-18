class PeaksController < ApplicationController

    get '/peaks/new' do 
        if !logged_in?
            redirect '/login'
        else
            erb :'peaks/new'
        end
    end

    post '/peaks' do
        if logged_in?  
            @peak = Peak.new(name: params[:name], location: params[:location], elevation: params[:elevation])
            if @peak.save
                redirect '/'
            else
                flash[:message] = "One or more required fields empty."
                redirect '/peaks/new'
            end                
        else
            redirect '/login'
        end
    end
end