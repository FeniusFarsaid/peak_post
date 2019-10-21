class PeaksController < ApplicationController

    get '/peaks' do
        @peaks = Peak.all
        erb :'/peaks'
    end

    get '/peaks/new' do 
        if !logged_in?
            redirect '/login'
        else
            "an edit post form"
        end
    end

end