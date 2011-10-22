module Qonfig
  module Test
    module Db
      CONFIG_DATA = {
        :user => {
          :view => {
            :analytics => {
              :bollinger => {
                :rows  => [
                  {
                    :key => :campaign_product,
                    :value => "Solaranlage",
                    :columns => [
                      {
                        :key =>       :cr,
                        :factor       => 5,
                        :nr_values    => 5
                      }
                    ]
                  }
                ],
                :defaults => {
                  :columns => [
                    {
                      :key          => :cr,
                      :factor       => 1,
                      :nr_values    => 10,
                      :data_points  => :weekly
                    }
                  ]
                }
              }
            }
          }
        }
      }
    end
  end
end
