# -*- encoding: utf-8 -*-
module Qonfig
  module Test
    module Db
      include Qonfig::Test::Fixtures::Api::PubPriv

      CONFIG_DATA = {
        "user" => {
          "view" => {
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
                    }
                  ]
                },
                "default_graphs"=> [
                  {
                    "type"          => "Qonfig::Analytics::Graph",
                    "uuid"          => "default_graph_uuid_1",
                    "keys"          => {},
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
                  },
                  {
                    "type"          => "Qonfig::Analytics::Graph",
                    "uuid"          => "default_graph_uuid_1",
                    "keys"          => {
                      "row_key"         => "campaign_product"
                    },
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
                    "keys"          => {
                      "row_key"         => "campaign_product",
                      "row_value"       => "solaranlagen",
                      "column_key"      => "conversions"
                    },
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
                    "keys"          => {
                      "row_key"       => "campaign_product",
                      "row_value"     => "solaranlagen",
                      "column_key"    => "cost",
                    },
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
                    "keys"          => {
                      "row_key"       => "campaign_product",
                      "row_value"     => "solaranlagen",
                      "column_key"    => "impressions",
                    },
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
                    "keys"          => {
                      "row_key"       => "campaign_product",
                      "row_value"     => "solaranlagen",
                      "column_key"    => "cr"
                    },
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
                    "keys"          => {
                      "row_key"       => "campaign_product",
                      "row_value"     => "solaranlagen",
                      "column_key"    => "cpa"
                    },
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
                    "keys"          => {
                      "row_key"       => "campaign_product",
                      "row_value"     => "solaranlagen",
                      "column_key"    => "clicks",
                    },
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
          },
          "api" => {
            "type"          => "Qonfig::Api::Api",
            "pub_priv"      => {
              "public_key"     => PUBLIC_KEY,
              "private_key"    => PRIVATE_KEY
            }
          }
        }
      }
    end
  end
end