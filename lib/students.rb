class Students
  attr_accessor :list
  
  def initialize
    self.list = [{name: 'Thomas', role: 'Coach'}, 
      {name: 'Bosse', role: 'Student'},
      {name: 'Erika', role: 'Student'},
      {name: 'Gustaf', role: 'Student'},
      {name: 'Chris', role: 'Student'},
      {name: 'Daniel', role: 'Student'},
      {name: 'David', role: 'Student'}]
  end
end