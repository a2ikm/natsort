require "test_helper"

class ArrayTest < MiniTest::Test
  def test_destructive_natsort
    original = ["1", "10", "2"]
    original.natsort!

    assert_equal ["1", "2", "10"], original
  end

  def test_destructive_natsort_by
    original = [
      { "m" => "1", "n" => "1" },
      { "m" => "2", "n" => "10" },
      { "m" => "3", "n" => "2" }
    ]
    original.natsort_by! { |x| x["n"] }

    expected = [
      { "m" => "1", "n" => "1" },
      { "m" => "3", "n" => "2" },
      { "m" => "2", "n" => "10" }
    ]

    assert_equal expected, original
  end
end
