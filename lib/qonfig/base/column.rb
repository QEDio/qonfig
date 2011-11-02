require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'

module Qonfig
  module Base
    class Column
      attr_accessor :key, :value

    end
  end
end