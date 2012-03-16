require 'test/unit'
require 'date'

class TC_testCalamity < Test::Unit::TestCase

  def setup
  end

  def teardown
  end

  def test_add_default_date
    `./bin/calamity add -d foo`
    #assert `./bin/calamity list foo | grep 'foo' | awk '{print $2}'` == "#{Date.today}" 
  end
end
