module Qonfig
  module DataSets
    class FormatColumn < FormatBase

      def initialize(ext_params = {})
        params             = default_params.merge(ext_params)

        super(params)
      end

      def default_params
        {

        }
      end
    end
  end
end