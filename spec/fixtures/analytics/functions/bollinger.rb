# -*- encoding: utf-8 -*-
module Qonfig
  module Test
    module Fixtures
      module Analytics
        module Functions
          module Bollinger
            include Base
                        
            DEVIATION_TYPE                        = "sd"
            DEVIATION_FACTOR                      = 99
            NUMBER_OF_VALUES_MOVING_AVERAGE       = 27

            DEFAULT_DEVIATION_TYPE                        = "sd"
            DEFAULT_DEVIATION_FACTOR                      = 1
            DEFAULT_NUMBER_OF_VALUES_MOVING_AVERAGE       = 1


            BOLLINGER_SERIALIZED_HASH_1         = {
              :type                             => "Qonfig::Analytics::Functions::Bollinger",
              :color                            => COLOR,
              :periodicity                      => PERIODICITY,
              :deviation_factor                 => DEVIATION_FACTOR,
              :deviation_type                   => DEVIATION_TYPE,
              :number_of_values_moving_average  => NUMBER_OF_VALUES_MOVING_AVERAGE,
              :name                             => NAME,
              :uuid                             => UUID,
              :configurable_attributes          => ["deviation_factor", "deviation_type"]
            }

            BOLLINGER_DEFAULT_SERIALIZED_HASH_1         = {
              :type                                   => "Qonfig::Analytics::Functions::Bollinger",
              :color                                  => DEFAULT_COLOR,
              :periodicity                            => DEFAULT_PERIODICITY,
              :deviation_factor                       => DEFAULT_DEVIATION_FACTOR,
              :deviation_type                         => DEFAULT_DEVIATION_TYPE,
              :number_of_values_moving_average        => DEFAULT_NUMBER_OF_VALUES_MOVING_AVERAGE,
              :name                                   => DEFAULT_NAME,
              :uuid                                   => DEFAULT_UUID,
              :configurable_attributes                => ["deviation_factor", "deviation_type"]
            }
          end
        end
      end
    end
  end
end