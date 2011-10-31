module Qonfig
  module Test
    module Db
      CONFIG_DATA = {
        "user" => {
          "view" => {
            "analytics" => {
              "bollinger" => {
                "order" => {
                  "alert" => 1,
                  "warn" => 2
                },
                "rows"  => {
                  "campaign_product" => {
                    "Solaranlage" => {
                      "columns" => {
                        "cr" => {
                          "alert" => {
                            "factor"       => 5,
                            "nr_values"    => 5
                          }
                        }
                      }
                    }
                  }
                },
                "defaults" => {
                  "columns" => {
                    "cr" => {
                      "alert" => {
                        "factor"       => 1,
                        "nr_values"    => 10,
                        "data_points"  => "weekly"
                      },
                      "warn" => {
                        "factor"       => 1,
                        "nr_values"    => 10,
                        "data_points"  => "weekly"
                      }
                    },
                    "conversions" => {
                      "alert" => {
                        "factor"       => 1,
                        "nr_values"    => 10,
                        "data_points"  => "weekly"
                      },
                      "warn" => {
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
      }
    end
  end
end
