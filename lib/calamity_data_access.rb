require 'sqlite3'

module Calamity
  class DataAccess
  
    def initialize db_location
      @db = SQLite3::Database.new db_location
      @db.execute <<-SQL
        create table tasks (
          name varchar(30),
          context varchar(30),
          project varchar(30)
        );
      SQL
    end

    def add_task task
      @db.execute "insert into tasks values (?,?,?)", [task.name, task.context, task.project]  
    end

    def list_tasks
      tasks = []
      @db.execute("select * from tasks") do |row|
        task = Task.new
        task.name = row[0]  
        tasks << task
      end
      tasks
    end
  end
end
