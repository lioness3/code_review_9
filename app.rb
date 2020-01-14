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
  @volunteers = Volunteer.all
  erb(:projects)
end

get '/projects' do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:projects)
end

get '/projects/add' do
  @projects = Project.all
  erb(:projects)
end

post '/projects/add' do
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

post '/projects/:id' do
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
