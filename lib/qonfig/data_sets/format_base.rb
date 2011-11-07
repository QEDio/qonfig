module Qonfig
  module DataSets
    class FormatBase
      attr_accessor :key, :value
      attr_accessor :key_mapping, :key_functions
      attr_accessor :value_mapping, :value_functions

      def initialize(ext_params = {})
        options               = default_params.merge(ext_params)

        @key                  = options[:key]
        @value                = options[:value]
        @key_mapping          = options[:key_mapping]
        @key_functions        = options[:key_functions]
        @value_mapping        = options[:value_mapping]
        @value_functions      = options[:value_functions]
      end

      def default_params
        {

        }
      end

      def match?( ext_options = {} )
        options         = ext_options

        (key.eql?(options[:key]) && value.eql?(options[:value]))
      end
    end
  end
end