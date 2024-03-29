module Qonfig
  module Test
    module Fixtures
      module Views
        module Partial
          include Qonfig::Test::Fixtures::Analytics::Graph
          include Qonfig::Test::Fixtures::Views::Base

          VIEWS_PARTIAL_UUID_1        = "views_partial_uuid_1"
          VIEWS_PARTIAL_NAME_1        = "views_partial_name_1"
          VIEWS_PARTIAL_DESCRIPTION_1 = "views_partial_description_1"
          VIEWS_PARTIAL_ORDER_1       = [ANALYTICS_GRAPH_SERIALIZED_HASH_2[:uuid], ANALYTICS_GRAPH_SERIALIZED_HASH_1[:uuid]]
          VIEWS_PARTIAL_DATA_1        = []
          VIEWS_PARTIAL_GRAPHS_1      = [ANALYTICS_GRAPH_SERIALIZED_HASH_1, ANALYTICS_GRAPH_SERIALIZED_HASH_2]

          VIEWS_PARTIAL_UUID_2        = "views_partial_uuid_2"
          VIEWS_PARTIAL_NAME_2        = "views_partial_name_2"
          VIEWS_PARTIAL_DESCRIPTION_2 = "views_partial_description_2"
          VIEWS_PARTIAL_ORDER_2       = [ANALYTICS_GRAPH_SERIALIZED_HASH_2[:uuid]]
          VIEWS_PARTIAL_DATA_2        = []
          VIEWS_PARTIAL_GRAPHS_2      = [ANALYTICS_GRAPH_SERIALIZED_HASH_2]

          VIEWS_PARTIAL_UUID_3        = "views_partial_uuid_3"
          VIEWS_PARTIAL_NAME_3        = "views_partial_name_3"
          VIEWS_PARTIAL_DESCRIPTION_3 = "views_partial_description_3"
          VIEWS_PARTIAL_ORDER_3       = [ANALYTICS_GRAPH_SERIALIZED_HASH_3[:uuid], ANALYTICS_GRAPH_SERIALIZED_HASH_4[:uuid]]
          VIEWS_PARTIAL_DATA_3        = []
          VIEWS_PARTIAL_GRAPHS_3      = [ANALYTICS_GRAPH_SERIALIZED_HASH_3, ANALYTICS_GRAPH_SERIALIZED_HASH_4]


          VIEWS_PARTIAL_SERIALIZED_HASH_1 = {
            :type           => Qonfig::Views::Partial.to_s,
            :uuid           => VIEWS_PARTIAL_UUID_1,
            :name           => VIEWS_PARTIAL_NAME_1,
            :description    => VIEWS_PARTIAL_DESCRIPTION_1,
            :order          => VIEWS_PARTIAL_ORDER_1,
            :graphs         => VIEWS_PARTIAL_GRAPHS_1,
            :default_graphs => [ANALYTICS_DEFAULT_GRAPH_NO_KEYS_SERIALIZED_HASH_1]
          }

          VIEWS_PARTIAL_SERIALIZED_HASH_2 = {
            :type           => Qonfig::Views::Partial.to_s,
            :uuid           => VIEWS_PARTIAL_UUID_2,
            :name           => VIEWS_PARTIAL_NAME_2,
            :description    => VIEWS_PARTIAL_DESCRIPTION_2,
            :order          => VIEWS_PARTIAL_ORDER_2,
            :graphs         => VIEWS_PARTIAL_GRAPHS_2
          }

          VIEWS_PARTIAL_SERIALIZED_HASH_3 = {
            :type           => Qonfig::Views::Partial.to_s,
            :uuid           => VIEWS_PARTIAL_UUID_3,
            :name           => VIEWS_PARTIAL_NAME_3,
            :description    => VIEWS_PARTIAL_DESCRIPTION_3,
            :order          => VIEWS_PARTIAL_ORDER_3,
            :graphs         => VIEWS_PARTIAL_GRAPHS_3,
            :default_graphs => [
              ANALYTICS_DEFAULT_GRAPH_NO_KEYS_SERIALIZED_HASH_1
            ]
          }

          VIEWS_PARTIAL_DEFAULT_SERIALIZED_HASH_1 = {
            :type           => Qonfig::Views::Partial.to_s,
            :uuid           => VIEWS_PARTIAL_UUID_1,
            :name           => VIEWS_PARTIAL_NAME_1,
            :description    => VIEWS_PARTIAL_DESCRIPTION_1,
            :order          => VIEWS_PARTIAL_ORDER_1,
            :default_graphs => [
              ANALYTICS_DEFAULT_GRAPH_NO_KEYS_SERIALIZED_HASH_1,
              ANALYTICS_DEFAULT_GRAPH_ROW_KEY_SERIALIZED_HASH_1,
              ANALYTICS_DEFAULT_GRAPH_ROW_KEY_ROW_VALUE_SERIALIZED_HASH_1,
              ANALYTICS_DEFAULT_GRAPH_ROW_KEY_ROW_VALUE_COLUMN_KEY_SERIALIZED_HASH_1
            ]
          }
        end
      end
    end
  end
end