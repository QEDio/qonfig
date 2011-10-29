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
                "order" => {
                  "alert" => 1
                },
                "rows"  => {
                  "campaign_product" => {
                    "solaranlagen" => {
                      "columns" => {
                        "cr" => {
                          "alert" => {
                            "factor"       => 1,
                            "nr_values"    => 10
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
      }
    end
  end
end