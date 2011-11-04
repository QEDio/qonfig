module Qonfig
  class Db
    attr_reader :data
    def initialize(ext_options = {})
      options   = default_options.merge(ext_options)
      @data     = options[:data]
    end

    def get(ext_options = {})
      options = default_get_options.merge(ext_options)

      raise Exception.new("No user provided!") if options[:user].blank?
      conf = data[options[:user]]

      if( conf && options[:view] )
        conf = conf[options[:view]]

        if( conf && options[:functions] )
          conf = conf[options[:functions]]
        end
      end

      return conf
    end

    def default_options
      {
        :data => self.class.data
      }
    end

    def default_get_options
      {

      }
    end

    def self.data
      {
        "type"          => "Qonfig::Views::View",
        "uuid"         => "views_view_uuid",
        "name"         => "Early Warning",
        "description"  => "With early warning you can do nothing wrong!",
        "order"        => [],
        "partials"     =>
          [{
            "type"          => "Qonfig::Views::Partial",
            "uuid"          => "views_partial_uuid_1",
            "name"          => "Adwords",
            "description"   => "Data form Google Adwords to show the way!",
            "order"         => ["keine_2", "keine_1"],
            "graphs"        => [
              {
                "type"          => "Qonfig::Analytics::Graph",
                "uuid"          => "keine_1",
                "row_key"       => "row_key_1",
                "row_value"     => "row_value_1",
                "column_key"    => "column_key_1",
                "column_value"  => "column_value_1",
                "name"          => "Conversions",
                "description"   => "For something big",
                "order"         => ["base_uuid"],
                "functions"     =>
                  [{
                    "type"                            => "Qonfig::Analytics::Functions::Bollinger",
                    "color"                           => "#xxxxxx",
                    "periodicity"                     => "daily",
                    "deviation_factor"                => 99,
                    "deviation_type"                  => "sd",
                    "number_of_values_moving_average" => 27,
                    "name"                            => "noName",
                    "uuid"                            => "base_uuid"
                  }]
              },
              {
                "type"          => "Qonfig::Analytics::Graph",
                "uuid"          => "keine_1",
                "row_key"       => "row_key_1",
                "row_value"     => "row_value_1",
                "column_key"    => "column_key_1",
                "column_value"  => "column_value_1",
                "name"          => "Conversions",
                "description"   => "For something big",
                "order"         => ["base_uuid"],
                "functions"     =>
                  [{
                    "type"                            => "Qonfig::Analytics::Functions::Bollinger",
                    "color"                           => "#xxxxxx",
                    "periodicity"                     => "daily",
                    "deviation_factor"                => 99,
                    "deviation_type"                  => "sd",
                    "number_of_values_moving_average" => 27,
                    "name"                            => "noName",
                    "uuid"                            => "base_uuid"
                  }]
              }]
          }]
      }
    end
    
    def self.data1
      {
        "kp" => {
          "early_warning" => {
            "analytics" => {
                

              "rows"  => {

                "campaign_product" => {
                  "solaranlagen" => {
                    "columns" => {
                      "cr" => {
                        "functions" => {
                          "order" => {

                          },
                          "arr" => [
                            "alert" => {
                              "type"         => "bollinger",
                              "factor"       => 1,
                              "nr_values"    => 10
                            }
                          ]
                        }
                      }
                    }
                  }
                }
              },
              "defaults" => {
                "columns" => {
                  "clicks" => {
                    "alert" => {
                      "factor"       => 3,
                      "nr_values"    => 10
                    },
                    "warn" => {
                      "factor"       => 2,
                      "nr_values"    => 10
                    }
                  },
                  "cpa" => {
                    "alert" => {
                      "factor"       => 3,
                      "nr_values"    => 10
                    },
                    "warn" => {
                      "factor"       => 2,
                      "nr_values"    => 10
                    }
                  },
                  "impressions" => {
                    "alert" => {
                      "factor"       => 3,
                      "nr_values"    => 10
                    },
                    "warn" => {
                      "factor"       => 2,
                      "nr_values"    => 10
                    }
                  },
                  "cost" => {
                    "alert" => {
                      "factor"       => 3,
                      "nr_values"    => 10
                    },
                    "warn" => {
                      "factor"       => 2,
                      "nr_values"    => 10
                    }
                  },
                  "conversions" => {
                    "alert" => {
                      "factor"       => 3,
                      "nr_values"    => 10
                    },
                    "warn" => {
                      "factor"       => 2,
                      "nr_values"    => 10
                    }
                  },
                  "cr" => {
                    "alert" => {
                      "factor"       => 3,
                      "nr_values"    => 10
                    },
                    "warn" => {
                      "factor"       => 2,
                      "nr_values"    => 10
                    }
                  }
                }
              }
            }
          }
        }
      }
    end
  end
end