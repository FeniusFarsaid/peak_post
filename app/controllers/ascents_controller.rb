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

    get '/ascents/:id/edit' do 
        if logged_in?
            @ascent = current_user.ascents.find_by_id(params[:id])
            if @ascent && @ascent.user == current_user
              erb :'ascents/edit'
            else
              redirect to '/login'
            end
          else
            redirect to '/login'
          end
    end 

    patch '/ascents/:id' do
        if logged_in?
            @ascent = current_user.ascents.find_by_id(params[:id])
            if @ascent
              if @ascent.update(datetime: params[:datetime], route: params[:route])
                redirect to "/user_profile"
              else
                redirect to "/ascents/#{@ascent.id}/edit"
              end
            else
              redirect to '/user_profile'
            end
        else
          redirect to '/login'
        end
    end

    delete '/ascents/:id' do
        if logged_in?
            @ascent = current_user.ascents.find_by_id(params[:id])
            if @ascent
                @ascent.destroy
            end
            redirect '/user_profile'
        else
            redirect '/login'
        end
    end 

end 