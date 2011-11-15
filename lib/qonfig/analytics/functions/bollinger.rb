module Qonfig
  module Analytics
    module Functions
      class Bollinger < Base
        attr_accessor :deviation_type
        attr_reader :number_of_values_moving_average, :deviation_factor

        DEFAULT_DEVIATION_FACTOR                      = 1
        DEFAULT_DEVIATION_TYPE                        = "sd"
        DEFAULT_NUMBER_OF_VALUES_MOVING_AVERAGE       = 20
        CONFIGURABLE_ATTRIBUTES                       = ["name", "color", "number_of_values_moving_average", "deviation_factor"]

        def initialize( ext_params = {} )
          params = default_params_weak.merge(ext_params).merge(default_params_strong)
          super(params)

          @deviation_type                          = params[:deviation_type]
          self.deviation_factor                    = params[:deviation_factor]
          self.number_of_values_moving_average     = params[:number_of_values_moving_average]
        end

        def default_params_strong
          {
            :type                               => self.class
          }
        end

        def number_of_values_moving_average=(value)
          @number_of_values_moving_average = value.to_i
        end

        def deviation_factor=(factor)
          @deviation_factor = factor.to_f
        end


        def default_params_weak
          {
            :deviation_factor                   => DEFAULT_DEVIATION_FACTOR,
            :deviation_type                     => DEFAULT_DEVIATION_TYPE,
            :number_of_values_moving_average    => DEFAULT_NUMBER_OF_VALUES_MOVING_AVERAGE,
            :configurable_attributes            => CONFIGURABLE_ATTRIBUTES
          }
        end

        def serializable_hash
          super.merge({
            :deviation_factor                   => deviation_factor,
            :deviation_type                     => deviation_type,
            :number_of_values_moving_average    => number_of_values_moving_average
          }).delete_if{|k,v|v.blank?}
        end
      end
    end
  end
end