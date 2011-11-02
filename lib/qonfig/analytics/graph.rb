require 'active_support/core_ext/string/inflections'
require 'active_support/core_ext/object/blank'

module Qonfig
  module Analytics
    class Graph
      attr_accessor :name, :description
      attr_accessor :row_key, :row_value, :column_key, :column_value
      attr_accessor :functions

      def initialize(ext_params = {})
        params          = default_params.merge(ext_params)
        @row_key        = params[:row_key]
        @row_value      = params[:row_value]
        @column_key     = params[:column_key]
        @column_value   = params[:column_value]
        @name           = params[:name]
        @description    = params[:description]
        @order          = params[:order]
        @functions      = add_functions(params[:functions])
      end

      def default_params
        {
          :functions    => {},
          :order        => []
        }
      end

      def add_functions( functions, ext_options )
        options = default_add_functions_options.merge(ext_options)
        Array(functions).each do |function|
          add_function( function, options)
        end
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
          raise Exception.new("Need id for function") if function[:id].nil?
        elsif( function.is_a?(Qonfig::Analytics::Functions::Base) )
          raise Exception.new("Need id for function") if function.id.nil?
        end

        function = Qonfig::Analytics::Functions::Factor.build( function )

        if( functions[:id].present? )
          if( options[:raise_on_duplicate_function])
            raise Exception.new("Raise on duplicate Function triggered")
          end

          if( options[:overwrite_function] )
            @functions[:id] = function
          end
        else
          @functions[:id] = function
        end
      end

      def default_add_function_options
        {
          :overwrite_function => false,
          :raise_on_duplicate_function => true
        }
      end

      def serializable_hash

      end
    end
  end
end