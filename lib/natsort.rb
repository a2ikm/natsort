require "natsort/version"
require "natcmp"

module Enumerable
  def natsort
    sort { |a, b| Natcmp.natcmp(a.to_s, b.to_s) }
  end

  def natsort_by(&block)
    sort { |a, b| Natcmp.natcmp(block.call(a).to_s, block.call(b).to_s) }
  end
end

class Array
  def natsort!
    replace(natsort)
  end

  def natsort_by!(&block)
    replace(natsort_by(&block))
  end
end
