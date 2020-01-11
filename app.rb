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
  erb(:home)
end
get '/home' do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:home)
end
get '/home/project' do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:home)
end
post '/home/project' do
  title = params[:title]
  activity = Project.new({:title => title, :id => @id })
  activity.save

  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:home)
end
