class Volunteer
attr_accessor :name, :project_id, :id
def initialize(attributes)
  @name = attributes.fetch(:name)
  @project_id = attributes.fetch(:project_id)
  @id = attributes.fetch(:id)
end
def self.all
  returned_volunteers = DB.exec("SELECT * FROM cities;")
  voilunteers = []
  returned_volunteers.each() do |person|
    name = person.fetch("name")
    id = person.fetch("id").to_i
    volunteers.push(City.new({:name => name, :id => id}))
  end
  volunteers
end

end
