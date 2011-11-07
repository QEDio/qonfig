module Qonfig
  module DataSets
    class Format
      attr_accessor :row, :column
      
      def initialize(ext_params = {})
        params            = default_params.merge(ext_params)

        set_row(params[:row])
        set_column(params[:column])
      end

      def default_params
        {

        }
      end

      def match?(ext_options = {})
        options             = default_match_options.merge(ext_options)
      end

      def default_match_options
        {

        }
      end
    end
  end
end