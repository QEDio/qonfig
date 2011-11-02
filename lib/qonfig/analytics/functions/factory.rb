require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'

module Qonfig
  module Analytics
    module Functions
      class Factory
        def initialize
          raise Exception.new("Don't do this")
        end
        
        def self.build(obj)
          if( obj.is_a?(Hash) )
            raise Exception.new("Need a type to perform my duties") if obj[:type].nil?
            return "Qonfig::Analytics::Functions::#{obj[:type]}".constantize.new(obj)
          elsif( obj.is_a?(Qonfig::Analytics::Functions::Base) )
            return obj
          end
        end
      end
    end
  end
end