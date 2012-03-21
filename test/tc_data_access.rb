require 'test/unit'
require 'calamity_data_access'
require 'calamity_task'

class TC_testDataAccess < Test::Unit::TestCase

  def setup
    `rm ./test/calamity.db`
  end

  def teardown
    `rm ./test/calamity.db`
  end
  
  def test_setting_db_location
    Calamity::DataAccess.new './test/calamity.db'
    assert File.exists?('./test/calamity.db')
  end

  def test_added_task_can_be_read
    da = Calamity::DataAccess.new './test/calamity.db'
    task = Calamity::Task.new
    task.name = 'foo'
    da.add_task task
    assert(da.list_tasks[0].name == 'foo')
  end

  def test_mark_as_complete
    da = Calamity::DataAccess.new './test/calamity.db'
    task = Calamity::Task.new
    task.name = 'foo'
    da.add_task task
    da.mark_finished task
    assert(da.list_tasks[0].status == 'finished')
  end

end
