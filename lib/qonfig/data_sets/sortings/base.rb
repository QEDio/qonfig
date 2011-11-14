module Qonfig
  module DataSets
    module Sortings
      class Base
        attr_accessor :key
        attr_accessor :order

        def initialize(ext_params = {})
          options               = default_params.merge(ext_params)

          @key                  = options[:key]
          @key_functions        = options[:key_sortings]
        end

        def default_params
          {

          }
        end

        def serializable_hash
          {
            :key                => key,
            :key_sortings       => key_sortings
          }.delete_if{|k,v|v.blank?}
        end

        def match?( ext_options = {} )
          options         = ext_options

          (key.eql?(options[:key]))
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