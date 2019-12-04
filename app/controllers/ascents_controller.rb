class AscentsController < ApplicationController

    get '/ascents' do
        erb :'ascents/ascents'
    end

    post '/ascents' do
        
        if logged_in?  
            @ascent = current_user.ascents.build(peak_id: params[:peak_id].to_i, user_id: current_user.id, datetime: params[:date], route: params[:route])
            if @ascent.save
                redirect '/user_profile'
                binding.pry
            else
                redirect '/ascents/new'
            end                
        else
            redirect '/login'
        end
    end

    get '/ascents/new' do 
        if !logged_in?
            redirect '/login'
        else
            @peaks = Peak.all
            erb :'/ascents/new'
        end
    end

    delete '/ascents/:id' do
        @ascent = Ascent.find_by(id: params[:id])
        if logged_in? && @ascent.user_id = current_user.id
        elsif @ascent.destroy
            redirect '/ascents'
        else
            redirect '/ascents/<%= @ascent.id %>'
        end
    end 

end 