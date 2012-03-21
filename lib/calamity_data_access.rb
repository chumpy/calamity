require 'sqlite3'

module Calamity
  class DataAccess
  
    def initialize db_location
      @db = SQLite3::Database.new db_location
      begin
        @db.execute <<-SQL
          create table tasks (
            name varchar(20),
            context varchar(20),
            project varchar(20),
            status varchar(10)
          );
        SQL
      rescue
      end
    end

    def add_task task
      @db.execute "insert into tasks values (?,?,?,?)", [task.name, task.context, task.project, task.status]  
    end

    def list_tasks
      tasks = []
      @db.execute("select * from tasks") do |row|
        task = Task.new
        task.name = row[0]  
        task.context = row[1]
        task.project = row[2]
        task.status = row[3]
        tasks << task
      end
      tasks
    end

    def mark_finished task
      @db.execute "update tasks set status = ? where name = ?", ['finished', task.name]
    end
  end
end
