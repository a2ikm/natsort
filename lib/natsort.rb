require "natsort/version"
require "natcmp"

module Enumerable
  def natsort
    sort { |a, b| Natcmp.natcmp(a.to_s, b.to_s) }
  end
end
