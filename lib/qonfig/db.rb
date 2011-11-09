# -*- encoding: utf-8 -*-
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
        conf = Qonfig::Factory.build(conf[options[:view]].symbolize_keys_rec)
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
        "kp" => {
          "early_warning" => {
            "type"         => "Qonfig::Views::View",
            "uuid"         => "views_view_uuid",
            "name"         => "Early Warning",
            "description"  => "With early warning you can do nothing wrong!",
            "order"        => ["views_partial_uuid_1"],
            "partials"     => [
              {
                "type"          => "Qonfig::Views::Partial",
                "uuid"          => "views_partial_uuid_1",
                "name"          => "Adwords",
                "description"   => "Data form Google Adwords to show the way!",
                "order"         => ["graph_uuid_1", "graph_uuid_2", "graph_uuid_3", "graph_uuid_4", "graph_uuid_5", "graph_uuid_6"],
                "data_set"      => {
                  "format" => [
                    {
                      "column"    => {
                        "key"             => "cr",
                        "key_mapping"     => "CR",
                        "value_functions" => [
                          {"lambda" => 'lambda {|number,places=1| "%.#{places}f" % number.to_f.round(places)}'}
                        ]
                      }
                    },
                    {
                      "column"    => {
                        "key"             => "campaign_product",
                        "key_mapping"     => "Produkt",
                        "value_mappings"  => {"solaranlagen" => "pupsanlagen", "garagen" => "superdings"},
                        "value_functions" => [
                          {"lambda" => 'lambda{|str| str.capitalize}'}
                        ]
                      }
                    },
                    {
                      "row"       => {
                        "key"     => "campaign_product",
                        "value"   => "wasserspender",
                      },
                      "column"    => {
                        "key"             => "impressions",
                        "value_mappings"  => {"0" => "##FUCK##"},
                      }
                    }
                  ]
                },
                "default_graphs"=> [
                  {
                    "type"          => "Qonfig::Analytics::Graph",
                    "uuid"          => "default_graph_uuid_1",
                    "row_key"       => nil,
                    "row_value"     => nil,
                    "column_key"    => nil,
                    "column_value"  => "",
                    "name"          => "Conversions",
                    "description"   => "For something big",
                    "order"         => ["error_uuid"],
                    "functions"     => [
                      {
                        "type"                            => "Qonfig::Analytics::Functions::Bollinger",
                        "color"                           => "#ff0000",
                        "periodicity"                     => "daily",
                        "deviation_factor"                => 3,
                        "deviation_type"                  => "sd",
                        "number_of_values_moving_average" => 10,
                        "name"                            => "error",
                        "uuid"                            => "error_uuid"
                      }
                    ]
                  }
                ],
                "graphs"        => [
                  {
                    "type"          => "Qonfig::Analytics::Graph",
                    "uuid"          => "graph_uuid_1",
                    "row_key"       => "campaign_product",
                    "row_value"     => "solaranlagen",
                    "column_key"    => "conversions",
                    "column_value"  => "",
                    "name"          => "Conversions",
                    "description"   => "For something big",
                    "order"         => ["error_uuid", "warn_uuid"],
                    "functions"     => [
                      {
                        "type"                            => "Qonfig::Analytics::Functions::Bollinger",
                        "color"                           => "#ff0000",
                        "periodicity"                     => "daily",
                        "deviation_factor"                => 3,
                        "deviation_type"                  => "sd",
                        "number_of_values_moving_average" => 10,
                        "name"                            => "error",
                        "uuid"                            => "error_uuid"
                      },
                      {
                        "type"                            => "Qonfig::Analytics::Functions::Bollinger",
                        "color"                           => "#f0a313",
                        "periodicity"                     => "daily",
                        "deviation_factor"                => 2,
                        "deviation_type"                  => "sd",
                        "number_of_values_moving_average" => 10,
                        "name"                            => "warn",
                        "uuid"                            => "warn_uuid"
                      }
                    ]
                  },
                  {
                    "type"          => "Qonfig::Analytics::Graph",
                    "uuid"          => "graph_uuid_2",
                    "row_key"       => "campaign_product",
                    "row_value"     => "solaranlagen",
                    "column_key"    => "cost",
                    "column_value"  => "",
                    "name"          => "Cost",
                    "description"   => "For something big",
                    "order"         => ["error_uuid"],
                    "functions"     => [
                      {
                        "type"                            => "Qonfig::Analytics::Functions::Bollinger",
                        "color"                           => "#ff0000",
                        "periodicity"                     => "daily",
                        "deviation_factor"                => 3,
                        "deviation_type"                  => "sd",
                        "number_of_values_moving_average" => 10,
                        "name"                            => "error",
                        "uuid"                            => "error_uuid"
                      }
                    ]
                  },
                  {
                    "type"          => "Qonfig::Analytics::Graph",
                    "uuid"          => "graph_uuid_3",
                    "row_key"       => "campaign_product",
                    "row_value"     => "solaranlagen",
                    "column_key"    => "impressions",
                    "column_value"  => "",
                    "name"          => "Impressions",
                    "description"   => "For something big",
                    "order"         => ["error_uuid"],
                    "functions"     => [
                      {
                        "type"                            => "Qonfig::Analytics::Functions::Bollinger",
                        "color"                           => "#ff0000",
                        "periodicity"                     => "daily",
                        "deviation_factor"                => 3,
                        "deviation_type"                  => "sd",
                        "number_of_values_moving_average" => 10,
                        "name"                            => "error",
                        "uuid"                            => "error_uuid"
                      }
                    ]
                  },
                  {
                    "type"          => "Qonfig::Analytics::Graph",
                    "uuid"          => "graph_uuid_4",
                    "row_key"       => "campaign_product",
                    "row_value"     => "solaranlagen",
                    "column_key"    => "cr",
                    "column_value"  => "",
                    "name"          => "CR",
                    "description"   => "For something big",
                    "order"         => ["error_uuid"],
                    "functions"     => [
                      {
                        "type"                            => "Qonfig::Analytics::Functions::Bollinger",
                        "color"                           => "#ff0000",
                        "periodicity"                     => "daily",
                        "deviation_factor"                => 3,
                        "deviation_type"                  => "sd",
                        "number_of_values_moving_average" => 10,
                        "name"                            => "error",
                        "uuid"                            => "error_uuid"
                      }
                    ]
                  },
                  {
                    "type"          => "Qonfig::Analytics::Graph",
                    "uuid"          => "graph_uuid_5",
                    "row_key"       => "campaign_product",
                    "row_value"     => "solaranlagen",
                    "column_key"    => "cpa",
                    "column_value"  => "",
                    "name"          => "CPA",
                    "description"   => "For something big",
                    "order"         => ["error_uuid"],
                    "functions"     => [
                      {
                        "type"                            => "Qonfig::Analytics::Functions::Bollinger",
                        "color"                           => "#ff0000",
                        "periodicity"                     => "daily",
                        "deviation_factor"                => 3,
                        "deviation_type"                  => "sd",
                        "number_of_values_moving_average" => 10,
                        "name"                            => "error",
                        "uuid"                            => "error_uuid"
                      }
                    ]
                  },
                  {
                    "type"          => "Qonfig::Analytics::Graph",
                    "uuid"          => "graph_uuid_6",
                    "row_key"       => "campaign_product",
                    "row_value"     => "solaranlagen",
                    "column_key"    => "clicks",
                    "column_value"  => "",
                    "name"          => "Clicks",
                    "description"   => "For something big",
                    "order"         => ["error_uuid"],
                    "functions"     => [
                      {
                        "type"                            => "Qonfig::Analytics::Functions::Bollinger",
                        "color"                           => "#ff0000",
                        "periodicity"                     => "daily",
                        "deviation_factor"                => 3,
                        "deviation_type"                  => "sd",
                        "number_of_values_moving_average" => 10,
                        "name"                            => "error",
                        "uuid"                            => "error_uuid"
                      }
                    ]
                  }
                ]
              }
            ]
          }
        }
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