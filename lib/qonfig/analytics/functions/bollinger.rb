module Qonfig
  module Analytics
    module Functions
      class Bollinger < Base
        TYPE                                          = "Bollinger"
        DEFAULT_DEVIATION_FACTOR                      = 1
        DEFAULT_DEVIATION_TYPE                        = "sd"
        DEFAULT_NUMBER_OF_VALUES_MOVING_AVERAGE       = 20

        attr_accessor :deviation_factor, :deviation_type
        attr_accessor :number_of_values_moving_average

        def initialize( ext_params = {} )
          params = default_params_week.merge(ext_params).merge(default_params_strong)
          super(params)

          @deviation_factor                   = params[:deviation_factor]
          @deviation_type                     = params[:deviation_type]
          @number_of_values_moving_average    = params[:number_of_values_moving_average]
        end

        def default_params_strong
          {
            :type       => TYPE
          }
        end

        def default_params_week
          {
            :deviation_factor                   => DEFAULT_DEVIATION_FACTOR,
            :deviation_type                     => DEFAULT_DEVIATION_TYPE,
            :number_of_values_moving_average    => DEFAULT_NUMBER_OF_VALUES_MOVING_AVERAGE
          }
        end

        def serializable_hash
          super.merge({
            :deviation_factor                   => deviation_factor,
            :deviation_type                     => deviation_type,
            :number_of_values_moving_average    => number_of_values_moving_average
          })
        end
      end
    end
  end
end