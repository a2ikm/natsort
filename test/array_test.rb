require "test_helper"

class ArrayTest < MiniTest::Test
  def test_destructive_natsort
    original = ["1", "10", "2"]
    original.natsort!

    assert_equal ["1", "2", "10"], original
  end

  def test_destructive_natsort_case_sensitive
    original = ["a", "B"]
    original.natsort!

    assert_equal ["B", "a"], original
  end

  def test_destructive_natsort_case_insensitive
    original = ["B", "a"]
    original.natsort!(false)

    assert_equal ["a", "B"], original
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

  def test_destructive_natsort_by_case_sensitive
    original = [
      { "m" => "1", "n" => "a" },
      { "m" => "2", "n" => "B" }
    ]
    original.natsort_by! { |x| x["n"] }

    expected = [
      { "m" => "2", "n" => "B" },
      { "m" => "1", "n" => "a" }
    ]

    assert_equal expected, original
  end

  def test_destructive_natsort_by_case_insensitive
    original = [
      { "m" => "1", "n" => "B" },
      { "m" => "2", "n" => "a" }
    ]
    original.natsort_by!(false) { |x| x["n"] }

    expected = [
      { "m" => "2", "n" => "a" },
      { "m" => "1", "n" => "B" }
    ]

    assert_equal expected, original
  end
end
