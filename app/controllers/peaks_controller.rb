class PeaksController < ApplicationController

    get '/peaks' do
        @peaks = Peak.all
        erb :'/peaks'
    end

    get '/newpeak' do 
        if !logged_in?
            redirect '/login'
        else
            erb :'/newpeak'
        end
    end

end