class AscentsController < ApplicationController

    get '/ascents' do
        erb :'ascents/ascents'
    end

    post '/ascents' do
        if logged_in?  
            @ascent = Ascent.new(params)
        else
            redirect '/login'
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