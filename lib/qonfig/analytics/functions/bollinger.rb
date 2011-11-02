module Qonfig
  module Analytics
    module Functions
      class Bollinger < Base
        TYPE        = "bollinger"

        def initialize( ext_params = {} )
          params = default_params_week.merge(ext_params).merge(default_params_strong)
          super(params)

          

        end

        def default_params_strong
          {
            :type       => TYPE
          }
        end

        def default_params_week
          {
            
          }
        end
      end
    end
  end
end