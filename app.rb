require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///life_event.db"

get '/main' do
	@schools =School.all
	@life_events =LifeEvent.all
	erb :"/main"
end


get '/schools' do
	@schools = School.all
	erb :"schools/index"
end

get '/schools/new' do
	erb :"schools/new"
end

post '/schools' do
	@school = School.new(params[:school])
	@school.save
	redirect :"schools"
end

get '/schools/:id' do
	@school = School.find(params[:id])
	erb :"schools/show"
end

delete '/schools/:id/delete' do
	@school = School.find(params[:id])
	@school.delete
	redirect :"/main"
end

get '/schools/:id/edit' do
	@school = School.find(params[:id])
	erb :"schools/edit"
end

put '/schools/:id' do
	@school = School.find(params[:id])
	@school.update_attributes(params[:school])
	redirect :"/schools"
end

post '/schools/search' do
	@user_input = params[:search]
	@search_results =School.where(name: @user_input)
	erb :"schools/results"
end



get '/life_events' do
	@life_events = LifeEvent.all
	erb :"life_events/index"
end

get '/life_events/new' do
	erb :"life_events/new"
end

post '/life_events' do
	@life_event = LifeEvent.new(params[:life_event])
	@life_event.save
	redirect :"life_events"
end

get '/life_events/:id' do
	@life_event = LifeEvent.find(params[:id])
	erb :"life_events/show"
end

delete '/life_events/:id/delete' do
	@life_event = LifeEevent.find(params[:id])
	@life_event.delete
	redirect :"/life_events"
end

get '/life_events/:id/edit' do
	@life_event = LifeEvent.find(params[:id])
	erb :"life_events/edit"
end

put '/life_events/:id' do
	@life_event = LifeEvent.find(params[:id])
	@life_event.update_attributes(params[:life_event])
	redirect :"/life_events"
end

post '/life_events/search' do
	@user_input = params[:search]
	@search_results =LifeEvent.where(description: @user_input)
	erb :"life_events/results"
end


class School <ActiveRecord::Base
end

class LifeEvent <ActiveRecord::Base
end