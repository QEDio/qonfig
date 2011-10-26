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

        if( conf && options[:function] )
          conf = conf[options[:function]]
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
        "kp" => {
          "early_warning" => {
            "analytics" => {
              "bollinger" => {
                "rows"  => {
                  #"campaign_product" => {
                  #  "solaranlagen" => {
                  #    "columns" => {
                  #      "cr" => {
                  #        "factor"       => 1.3,
                  #        "nr_values"    => 10
                  #      }
                  #    }
                  #  }
                  #}
                },
                "defaults" => {
                  "columns" => {
                    "clicks" => {
                      "factor"       => 1,
                      "nr_values"    => 10,
                      "data_points"  => "weekly"
                    },
                    "cpa" => {
                      "factor"       => 1,
                      "nr_values"    => 10,
                    },
                    "impressions" => {
                      "factor"       => 1,
                      "nr_values"    => 10,
                      "data_points"  => "weekly"
                    },
                    "cost" => {
                      "factor"       => 1,
                      "nr_values"    => 10,
                      "data_points"  => "weekly"
                    },
                    "conversions" => {
                      "factor"       => 1,
                      "nr_values"    => 10,
                      "data_points"  => "weekly"
                    },
                    "cr" => {
                      "factor"       => 1,
                      "nr_values"    => 10,
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