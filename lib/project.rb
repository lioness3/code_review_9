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
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def ==(project_to_compare)
    self.title() == project_to_compare.title()
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    if project
      title = project.fetch("title")
      id = project.fetch("id").to_i
      Project.new({:title => title, :id => id})
    else
      nil
    end
  end

  def volunteers
    Volunteer.find_by_project(self.id)
  end


  def update(attributes)

    @title = attributes.fetch(:title)

    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id};")
  end

end

# if (attributes.has_key?(:album_name)) && (attributes.fetch(:album_name) != nil)
#     album_name = attributes.fetch(:album_name)
#     album = DB.exec("SELECT * FROM albums WHERE lower(name)='#{album_name.downcase}';").first
#     if album != nil
#       DB.exec("INSERT INTO albums_artists (album_id, artist_id) VALUES (#{album['id'].to_i}, #{@id});")
#     end
#   end

# def ==(song_to_compare)
#   if song_to_compare != nil
#     (self.name() == song_to_compare.name()) && (self.album_id() == song_to_compare.album_id())
#   else
#     false
#   end
# end
