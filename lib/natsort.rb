require "natsort/version"
require "natcmp"

module Enumerable
  def natsort(case_sensitive = true)
    ignore_case = !case_sensitive
    sort { |a, b| Natcmp.natcmp(a.to_s, b.to_s, ignore_case) }
  end

  def natsort_by(case_sensitive = true, &block)
    ignore_case = !case_sensitive
    sort { |a, b| Natcmp.natcmp(block.call(a).to_s, block.call(b).to_s, ignore_case) }
  end
end

class Array
  def natsort!(case_sensitive = true)
    replace(natsort(case_sensitive))
  end

  def natsort_by!(case_sensitive = true, &block)
    replace(natsort_by(case_sensitive, &block))
  end
end
