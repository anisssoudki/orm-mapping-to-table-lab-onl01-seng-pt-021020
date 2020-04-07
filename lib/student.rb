class Student

  attr_accessor :name, :grade
  attr_reader :id
 
  def initialize(name, grade, id=nil)
   
    @name = name
    @grade = grade
  end
 
  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS Students (
         
        name TEXT, 
        grade TEXT
        )
        SQL
    DB[:conn].execute(sql) 
  end
 
  def save
    sql = <<-SQL
      INSERT INTO Students (name, grade) 
      VALUES (?, ?)
    SQL
 
    DB[:conn].execute(sql, self.name, self.grade)
 
  end
 

end
