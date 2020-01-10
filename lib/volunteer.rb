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
    self.name() == volunteer_to_compare.name()
  end
  def save
    result = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
    @id =result.first().fetch("id").to_i
  end
  # def self.find(id)
  #  person = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
  #  name = person.fetch("name")
  #  project_id = person.fetch("project_id").to_i
  #  id = person.fetch("id").to_i
  #  Song.new({:name => name, :project_id => project_id, :id => id})
  # end
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
end
