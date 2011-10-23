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
                  "campaign_product" => {
                    "solaranlagen" => {
                      "columns" => {
                        "cr" => {
                          "factor"       => 5,
                          "nr_values"    => 5
                        }
                      }
                    }
                  }
                },
                "defaults" => {
                  "columns" => {
                    "cr" => {
                      "factor"       => 1,
                      "nr_values"    => 10,
                      "data_points"  => "weekly"
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