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

            SERIALIZED_HASH                       = {
              :type                             => "bollinger",
              :color                            => "#xxxxxx",
              :periodicity                      => "daily",
              :deviation_factor                 => 99,
              :deviation_type                   => "sd",
              :number_of_values_moving_average  => 27
            }
          end
        end
      end
    end
  end
end