require "test_helper"

class NatsortTest < MiniTest::Test
  def test_natsort_strings
    actual = ["1", "10", "2"].natsort
    assert_equal ["1", "2", "10"], actual
  end

  def test_natsort_numbers
    actual = [1, 10, 2].natsort
    assert_equal [1, 2, 10], actual
  end
end
