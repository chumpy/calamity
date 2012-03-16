require 'sqlite3'

class Calamity::DataAccess
  @@db_location = "#{ENV['HOME']}/.calamity/calamity.db"
  @@db = SQLite3::Database.new @@db_location
  
  def self.init
    @@db.execute <<-SQL
      create table tasks (
        name varchar(30)
      );
    SQL
  end

  def self.add_task task
    @@db.execute "insert into tasks values (?)", task.name  
  end

  def self.list_tasks
    tasks = []
    @@db.execute("select * from tasks") do |row|
      tasks << Task.new
    end
    tasks
  end
end
