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
end
