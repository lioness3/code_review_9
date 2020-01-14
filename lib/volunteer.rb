class Volunteer
  attr_accessor :name, :project_id, :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each() do |person|
      name = person.fetch("name")
      id = person.fetch("id").to_i
      project_id = person.fetch("project_id").to_i
      volunteers.push(Volunteer.new({:name => name,:project_id => project_id, :id => id}))
    end
    volunteers
  end

  def ==(volunteer_to_compare)
    (self.name() == volunteer_to_compare.name()) && (self.project_id() == volunteer_to_compare.project_id())
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id =result.first().fetch("id").to_i
  end

  def self.find(id)
    person = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    if person
      name = person.fetch("name")
      project_id = person.fetch("project_id").to_i
      id = person.fetch("id").to_i
      Volunteer.new({:id => id, :project_id => project_id, :name => name})
    else
      nil
    end
  end

  def update(attributes)
    if (attributes.has_key?(:name)) && (attributes.fetch(:name) != nil)
      @name = attributes.fetch(:name)
      DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@id};")
    elsif (attributes.has_key?(:project_id)) && (attributes.fetch(:project_id) != nil)
      project_id = attributes.fetch(:project_id)
      project = DB.exec("SELECT * FROM projects WHERE lower(name)='#{project_id.downcase}';").first
      if project != nil
        DB.exec("INSERT INTO projects_artists (project_id, artist_id) VALUES (#{project['id'].to_i}, #{@id});")
      end
    end
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{@id};")
    # DB.exec("DELETE FROM projects WHERE city_id = #{@id};") # new code
  end

  def self.find_by_project(p_id)
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{p_id};")
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => p_id, :id => id}))
    end
    volunteers
  end
end
