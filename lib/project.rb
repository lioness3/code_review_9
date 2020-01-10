class Project
attr_accessor :id, :title

def initialize(attributes)
  @title = attributes.fetch(:title)
  @id = attributes.fetch(:id)
end

def save
  result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
  @id =result.first().fetch("id").to_i
end

def self.all
  returned_projects = DB.exec("SELECT * FROM projects;")
  projects = []
  returned_projects.each() do |person|
    title = person.fetch("title")
    id = person.fetch("id").to_i
    project_id = person.fetch("project_id").to_i
    projects.push(Volunteer.new({:title => title, :id => id}))
  end
  projects
end

end
