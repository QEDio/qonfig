module Qonfig
  module DataSets
    module Formats
      class Base
        attr_accessor :key, :value
        attr_accessor :key_mapping, :key_functions
        attr_accessor :value_mappings, :value_functions

        def initialize(ext_params = {})
          options               = default_params.merge(ext_params)

          @key                  = options[:key]
          @value                = options[:value]
          @key_mapping          = options[:key_mapping]
          @key_functions        = options[:key_functions]
          @value_mappings       = options[:value_mappings]
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

        def serializable_hash
          {
            :key                => key,
            :value              => value,
            :key_mapping        => key_mapping,
            :key_functions      => key_functions,
            :value_mappings     => value_mappings,
            :value_functions    => value_functions
          }.delete_if{|k,v|v.blank?}
        end

        def eql?(other)
          serializable_hash == other.serializable_hash
        end

        def ==(other)
          eql?(other)
        end
      end
    end
  end
end