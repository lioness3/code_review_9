require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get '/' do
  @projects = Project.all
  erb(:projects)
end

get '/projects' do
  @projects = Project.all
  erb(:projects)
end

get '/projects/new' do
  erb(:projects)
end

post '/projects/new' do
  title = params[:title]
  activity = Project.new({:title => title, :id => @id })
  activity.save
  @projects = Project.all
  erb(:projects)
end

get '/projects/:id' do
  @project = Project.find(params[:id].to_i())
   erb(:project)
end

get '/projects/:id/edit' do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch '/projects/:id' do
  @project = Project.find(params[:id].to_i())
  @project.update(:title => params[:title])
  @projects = Project.all
  erb(:project)
end

delete '/projects/:id' do
  @project = Project.find(params[:id].to_i())
  @project.delete
  @projects = Project.all
  erb(:project)
end

get '/projects/:id/volunteers/:volunteer_id' do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  erb(:volunteers)
end

post '/projects/:id/volunteers' do
  @project = Project.find(params[:id].to_i())
  @volunteer = Volunteer.new({:name => params[:name], :project_id => @project.id, :id => nil})
  @volunteer.save()
  erb(:project)
end

patch '/projects/:id/volunteers/:volunteer_id' do
  @project = Project.find(params[:id].to_i())
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  @volunteer.update(:name => params[:name], :project_id => @project.id)
  erb(:project)
end

delete '/projects/:id/volunteers' do
  volunteer = Volunteer.find(params[:volunteer_id].to_i)
  volunteer.delete()
  @project = Project.find(params[:id].to_i())
  erb(:project)
end
