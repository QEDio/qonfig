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

      if( options[:view] )
        conf = get_by_type( :view, options )
      elsif( options[:api] )
        conf = get_by_type( :api, options )
      else
        raise Exception.new("No known type found")
      end
      
      return conf
    end

    def get_by_type( type, ext_options = {} )
      options     = {}.merge(ext_options)

      ret_val = case type
          when :view then get_view( options )
          when :api then get_api( options )
          else raise Exception.new("Type #{type} is not supported!")
      end

      return ret_val
    end

    def get_complete_user_config( user )
      @complete_config ||= data[user]
    end

    def get_view( options )
      view = Qonfig::Views::View.new

      if( get_complete_user_config(options[:user]).present? )
        if( get_complete_user_config(options[:user])[options[:view]].present? )
          view = Qonfig::Factory.build(get_complete_user_config(options[:user])[options[:view]].symbolize_keys_rec)
        end
      end

      return view
    end

    def get_api( options )
      api = Qonfig::Api::Api.new

      if( get_complete_user_config(options[:user]).present? )
        if( get_complete_user_config(options[:user])["api"].present? )
          api = Qonfig::Factory.build(get_complete_user_config(options[:user])["api"].symbolize_keys_rec)
        end
      end

      return api
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
          "api" => {
            "type"          => "Qonfig::Api::Api",
            "pub_priv"      => {
              "pub_key"     => "",
              "priv_key"    => ""
            }
          },
          "adwords_db"     => {
            "type"         => "Qonfig::Views::View",
            "uuid"         => "views_view_uuid",
            "name"         => "Adwords DB",
            "description"  => "AdwordsDB for the masses",
            "order"        => ["views_partial_uuid_1"],
            "partials"     => [
              {
                "type"          => "Qonfig::Views::Partial",
                "uuid"          => "views_partial_uuid_1",
                "name"          => "Adwords",
                "description"   => "Data form Google Adwords to show the way!",
                "order"         => [],
                "data_set"      => {
                  "formatings" => [
                  ],
                  "sortings" => [
                    {
                      "row"     => {
                        "key"  => "cost",
                        "functions"    => [
                          {"lambda" => 'lambda{|n1,n2| n2 <=> n1}'}
                        ]
                      }
                    }
                  ]
                }
              }
            ]
          },
          "early_warning"  => {
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
                  "formatings" => [
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
                        "key"             => "cpa",
                        "key_mapping"     => "CPA",
                        "value_functions" => [
                          {"lambda" => 'lambda {|number, precision=1| Qed::Format::Helpers.new.number_with_precision(number, :precision => precision, :delimiter => I18n.t(:"number.format.delimiter"))}'}
                        ]
                      }
                    },
                    {
                      "column"    => {
                        "key"             => "cost",
                        "key_mapping"     => "Kosten",
                        "value_functions" => [
                          {"lambda" => 'lambda {|number, precision=1| Qed::Format::Helpers.new.number_with_precision(number, :precision => precision, :delimiter => I18n.t(:"number.format.delimiter"))}'}
                        ]
                      }
                    },
                    {
                      "column"    => {
                        "key"             => "impressions",
                        "value_functions" => [
                          {"lambda" => 'lambda {|number, precision=0| Qed::Format::Helpers.new.number_with_precision(number, :precision => precision, :delimiter => I18n.t(:"number.format.delimiter"))}'}
                        ]
                      }
                    },
                    {
                      "column"    => {
                        "key"             => "clicks",
                        "key_mapping"     => "Klicks",
                        "value_functions" => [
                          {"lambda" => 'lambda {|number, precision=0| Qed::Format::Helpers.new.number_with_precision(number, :precision => precision, :delimiter => I18n.t(:"number.format.delimiter"))}'}
                        ]
                      }
                    },
                    {
                      "column"    => {
                        "key"             => "campaign_product",
                        "key_mapping"     => "Produkt",
                        "value_functions" => [
                          {"lambda" => 'lambda{|str| str.capitalize}'}
                        ]
                      }
                    }
                  ],
                  "sortings" => [
                    {
                      "row"     => {
                        "key"  => "conversions",
                        "functions"    => [
                          {"lambda" => 'lambda{|n1,n2| n2 <=> n1}'}
                        ]
                      }
                    }
                  ]
                },
                "default_graphs"=> [
                  {
                    "type"          => "Qonfig::Analytics::Graph",
                    "uuid"          => "default_graph_uuid_1",
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
                        "uuid"                            => "error_uuid",
                        "above"                           => "red",
                        "below"                           => "green",
                        "with_color"                      => "false"
                      },
                      {
                        "type"                            => "Qonfig::Analytics::Functions::Bollinger",
                        "color"                           => "#fc9700",
                        "periodicity"                     => "daily",
                        "deviation_factor"                => 2,
                        "deviation_type"                  => "sd",
                        "number_of_values_moving_average" => 10,
                        "name"                            => "warn",
                        "uuid"                            => "warn_uuid",
                        "above"                           => "bielig_top",
                        "below"                           => "bielig_bottom"
                      }
                    ]
                  }
                ],
                "graphs"        => [
                  {
                    "type"          => "Qonfig::Analytics::Graph",
                    "uuid"          => "graph_uuid_1",
                    "keys"          => {
                      "row_key"       => "campaign_product",
                      "row_value"     => "solaranlagen",
                      "column_key"    => "conversions",
                      "column_value"  => ""
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
                      "column_value"  => ""
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
                      "column_value"  => ""
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
                      "column_key"    => "cr",
                      "column_value"  => ""
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
                      "column_key"    => "cpa",
                      "column_value"  => "",
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
                      "column_value"  => ""
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
          }
        }
      }
    end
  end
end