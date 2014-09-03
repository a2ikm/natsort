require "test_helper"

class EnumerableTest < MiniTest::Test
  def test_natsort_strings
    actual = ["1", "10", "2"].natsort
    assert_equal ["1", "2", "10"], actual
  end

  def test_natsort_numbers
    actual = [1, 10, 2].natsort
    assert_equal [1, 2, 10], actual
  end

  def test_natsort_by
    actual = [
      { "m" => "1", "n" => "1" },
      { "m" => "2", "n" => "10" },
      { "m" => "3", "n" => "2" }
    ].natsort_by { |x| x["n"] }

    expected = [
      { "m" => "1", "n" => "1" },
      { "m" => "3", "n" => "2" },
      { "m" => "2", "n" => "10" }
    ]

    assert_equal expected, actual
  end
end
