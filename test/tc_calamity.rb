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
    `./bin/calamity --database="./test/calamity.db" save foo`
    assert File.exists?('./test/calamity.db')
  end

  def test_add_task_adds_task
    `./bin/calamity --database="./test/calamity.db" save foobar`
    foo = `./bin/calamity --database="./test/calamity.db" list | grep foo | awk '{print $1}'`.strip
    assert(foo.eql?("foobar"))
  end

  def test_context_on_add
    `./bin/calamity --database="./test/calamity.db" save foobar -c "online"`
    context = `./bin/calamity --database="./test/calamity.db" list | grep foo | awk '{print $2}'`.strip
    assert(context.eql?("online"))
  end

  def test_project_on_add
    `./bin/calamity --database="./test/calamity.db" save foobar -p "buildcalamity"`
    project = `./bin/calamity --database="./test/calamity.db" list | grep foo | awk '{print $3}'`.strip
    assert(project.eql?("buildcalamity"))
  end
 
  def test_finish_task
    `./bin/calamity --database="./test/calamity.db" save foobar`
    `./bin/calamity --database="./test/calamity.db" finish foobar`
    foo = `./bin/calamity --database="./test/calamity.db" list | grep foo | awk '{print $1}'`.strip
    assert(foo.eql?(""))
  end

  def test_char_limit_on_task_name
    `./bin/calamity --database="./test/calamity.db" save foobardfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdfdf`
    foo = `./bin/calamity --database="./test/calamity.db" list | grep foo | awk '{print $1}'`.strip
    assert(foo.eql?(""))
  end

end
