require 'test/unit'
require 'date'

class TC_testCalamity < Test::Unit::TestCase
  def setup
    `rm ./test/calamity.db`
  end

  def teardown
    `rm ./test/calamity.db`
  end

  def test_create_db
    `./bin/calamity --database="./test/calamity.db" add foo`
    assert File.exists?('./test/calamity.db')
  end

  def test_add_task_adds_task
    `./bin/calamity --database="./test/calamity.db" add foobar`
    foo = `./bin/calamity --database="./test/calamity.db" list | grep foo | awk '{print $1}'`.strip
    assert(foo.eql?("foobar"))
  end

  def test_context_on_add
    `./bin/calamity --database="./test/calamity.db" add foobar -c "online"`
    context = `./bin/calamity --database="./test/calamity.db" list | grep foo | awk '{print $2}'`.strip
    assert(context.eql?("online"))
  end

  def test_project_on_add
    `./bin/calamity --database="./test/calamity.db" add foobar -p "buildcalamity"`
    project = `./bin/calamity --database="./test/calamity.db" list | grep foo | awk '{print $3}'`.strip
    assert(project.eql?("buildcalamity"))
  end
end
