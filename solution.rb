require 'sinatra'
require 'sinatra/reloader' if development?
require 'make_todo'

get '/' do 
	@tareas = Tarea.all 
	erb :home

end 
get '/sin_terminar' do 
	@tareas = Tarea.all 
	erb :tareas_sin_terminar

end 
get '/terminadas' do 
	@tareas = Tarea.all 
	erb :tareas_terminadas

end 

post '/' do
	@tarea = Tarea.create(params[:tarea])
	redirect '/'
end

get '/:id' do 
	@tarea = Tarea.find(params[:id])
	erb :delete

end 

delete '/:id' do
	@tarea = Tarea.destroy(params[:id])
	redirect '/'
end

get '/:id/terminar' do 
	@tarea = Tarea.find(params[:id])
	erb :terminar

end 

get '/:id/complete' do
  Tarea.update(params[:id])
  redirect '/'
end

