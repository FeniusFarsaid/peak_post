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

end