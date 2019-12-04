class PeaksController < ApplicationController

    get '/peaks' do
        @peaks = Peak.all
        erb :'/peaks'
    end

    get '/peaks/new' do 
        if !logged_in?
            redirect '/login'
        else
            erb :'/peaks/new'
        end
    end

    post '/peaks' do
        #binding.pry
        if logged_in?  
            @peak = Peak.new(name: params[:name], location: params[:location], elevation: params[:elevation])
            if @peak.save
                redirect '/user_profile'
                #binding.pry
            else
                redirect '/peaks/new'
            end                
        else
            redirect '/login'
        end
    end
end