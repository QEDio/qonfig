require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'

module Qonfig
  module Base
    class Row
      attr_accessor :key, :value
      attr_accessor :columns

    end
  end
end