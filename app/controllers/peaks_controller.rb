class PeaksController < ApplicationController

    get '/peaks' do
        "A list of peaks from the DB"
    end

    get '/peaks/new' do 
        if !logged_in?
            redirect '/login'
        else
            "an edit post form"
        end
    end

end