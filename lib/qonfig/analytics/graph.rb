require 'uuid'
require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'


module Qonfig
  module Analytics
    class Graph
      attr_accessor :name, :description
      attr_accessor :row_key, :row_value, :column_key, :column_value
      attr_accessor :functions, :order
      attr_writer :uuid

      def initialize(ext_params = {})
        params          = default_params.merge(ext_params)
        @uuid           = params[:uuid]
        @row_key        = params[:row_key]
        @row_value      = params[:row_value]
        @column_key     = params[:column_key]
        @column_value   = params[:column_value]
        @name           = params[:name]
        @description    = params[:description]
        @order          = params[:order]

        @functions      = {}
        add_functions(params[:functions])
      end

      def default_params
        {
          :functions    => [], # functions are provided externally as array, but stored internally in a hash
          :order        => []
        }
      end

      def uuid
        @uuid ||= UUID.new.generate(:compact)
      end

      def add_functions( functions, ext_options = {} )
        options = default_add_functions_options.merge(ext_options)
        Array(functions).each do |function|
          add_function( function, options)
        end
        self
      end

      def default_add_functions_options
        {
          :overwrite_function => false,
          :raise_on_duplicate_function => true
        }
      end

      def add_function( function, ext_options = {} )
        options = default_add_function_options.merge(ext_options)

        if( function.is_a?(Hash) )
          raise Exception.new("Need uuid for function") if function[:uuid].nil?
        elsif( function.is_a?(Qonfig::Analytics::Functions::Base) )
          raise Exception.new("Need uuid for function") if function.uuid.nil?
        else
          raise Exception.new("Don't know how to convert #{function.class} into a function-object")
        end

        uuid = function[:uuid]
        factory_function = Qonfig::Analytics::Functions::Factory.build( function )

        if( @functions[uuid].present? )
          if( options[:raise_on_duplicate_function])
            raise Exception.new("Raise on duplicate Function triggered")
          end

          if( options[:overwrite_function] )
            @functions[uuid] = factory_function
          end
        else
          @functions[uuid] = factory_function
        end
        self
      end

      def default_add_function_options
        {
          :overwrite_function => false,
          :raise_on_duplicate_function => true
        }
      end

      def serializable_hash
        {
          :uuid             => uuid,
          :name             => name,
          :description      => description,
          :row_key          => row_key,
          :row_value        => row_value,
          :column_key       => column_key,
          :column_value     => column_value,
          :functions        => serializable_functions,
          :order            => order,
          #:type             => self.class
        }
      end

      def serializable_functions
        @functions.map{|k,v|v.serializable_hash}
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