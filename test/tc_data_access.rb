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

  def test_update_task
    da = Calamity::DataAccess.new './test/calamity.db'
    task = Calamity::Task.new
    task.name = 'foo'
    task.context = 'inbox'
    da.add_task task
    assert(da.list_tasks[0].context == 'inbox')
    task.context = 'bar'
    da.add_task task
    assert(da.list_tasks[0].context == 'bar')
  end

  def test_task_can_not_be_inserted_if_one_with_same_name_already_exists
    da = Calamity::DataAccess.new './test/calamity.db'
    task = Calamity::Task.new
    task.name = 'foo'
    da.add_task task
    task2 = Calamity::Task.new
    task2.name = 'foo'
    da.add_task task2
    assert da.list_tasks.length == 1 
  end

  def test_list_unfinished_by_default
    da = Calamity::DataAccess.new './test/calamity.db'
    task = Calamity::Task.new
    task.name = 'foo'
    da.add_task task
    da.mark_finished task
    task2 = Calamity::Task.new
    task2.name = 'goo'
    da.add_task task2
    assert da.list_tasks.size == 1
  end

end
