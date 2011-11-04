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

            BOLLINGER_SERIALIZED_HASH_1         = {
              :type                             => "Qonfig::Analytics::Functions::Bollinger",
              :color                            => COLOR,
              :periodicity                      => PERIODICITY,
              :deviation_factor                 => DEVIATION_FACTOR,
              :deviation_type                   => DEVIATION_TYPE,
              :number_of_values_moving_average  => NUMBER_OF_VALUES_MOVING_AVERAGE,
              :name                             => NAME,
              :uuid                             => UUID
            }
          end
        end
      end
    end
  end
end