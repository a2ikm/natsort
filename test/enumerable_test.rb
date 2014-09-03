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

  def test_natsort_case_sensitive
    actual = ["a", "B"].natsort
    assert_equal ["B", "a"], actual
  end

  def test_natsort_case_insensitive
    actual = ["B", "a"].natsort(false)
    assert_equal ["a", "B"], actual
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

  def test_natsort_by_case_sensitive
    actual = [
      { "m" => "1", "n" => "a" },
      { "m" => "2", "n" => "B" }
    ].natsort_by { |x| x["n"] }

    expected = [
      { "m" => "2", "n" => "B" },
      { "m" => "1", "n" => "a" }
    ]

    assert_equal expected, actual
  end

  def test_natsort_by_case_insensitive
    actual = [
      { "m" => "1", "n" => "B" },
      { "m" => "2", "n" => "a" }
    ].natsort_by(false) { |x| x["n"] }

    expected = [
      { "m" => "2", "n" => "a" },
      { "m" => "1", "n" => "B" }
    ]

    assert_equal expected, actual
  end
end
