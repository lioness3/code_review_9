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
  @volunteers = Volunteer.all
  erb(:projects)
end
post '/projects/add' do
  title = params[:title]
  activity = Project.new({:title => title, :id => @id })
  activity.save
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:projects)
end
get '/projects/:id' do
  @project = Project.find(params[:id].to_i())
  @projects = Project.all
  @volunteers = Volunteer.all
   erb(:project)
end
post '/projects/:id' do
  @project = Project.find(params[:id].to_i())
  @projects = Project.all
  @volunteers = Volunteer.all
   erb(:project)
end
get '/projects/:id/edit' do
  @project = Project.find(params[:id].to_i())
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:edit_project)
end
post '/projects/:id/edit' do
  @project = Project.find(params[:id].to_i())
  @project.update(params[:title])
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:projects)
end
patch '/projects/:id/edit' do
  @project = Project.find(params[:id].to_i())
  @project.update(params[:title])
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:projects)
end
