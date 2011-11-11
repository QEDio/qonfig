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

            if obj[:type].is_a?(String)
              return obj[:type].constantize.new(obj)
            else
              return obj[:type].new(obj)
            end
          elsif( obj.is_a?(Qonfig::Analytics::Functions::Base) )
            return obj
          end
        end
      end
    end
  end
end