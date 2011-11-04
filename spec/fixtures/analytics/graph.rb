module Qonfig
  module Test
    module Fixtures
      module Analytics
        module Graph
          include Qonfig::Test::Fixtures::Analytics::Functions::Bollinger

          ANALYTICS_GRAPH_UUID_1          = "keine_1"
          ANALYTICS_GRAPH_ROW_KEY_1       = "row_key_1"
          ANALYTICS_GRAPH_ROW_VALUE_1     = "row_value_1"
          ANALYTICS_GRAPH_COLUMN_KEY_1    = "column_key_1"
          ANALYTICS_GRAPH_COLUMN_VALUE_1  = "column_value_1"
          ANALYTICS_GRAPH_NAME_1          = "name_1"
          ANALYTICS_GRAPH_DESCRIPTION_1   = "description_1"
          ANALYTICS_GRAPH_FUNC_1          = BOLLINGER_SERIALIZED_HASH_1
          ANALYTICS_GRAPH_ORDER_1         = [BOLLINGER_SERIALIZED_HASH_1[:uuid]]
          ANALYTICS_GRAPH_FUNCTIONS_1     = [ANALYTICS_GRAPH_FUNC_1]

          ANALYTICS_GRAPH_UUID_2          = "keine_2"
          ANALYTICS_GRAPH_ROW_KEY_2       = "row_key_2"
          ANALYTICS_GRAPH_ROW_VALUE_2     = "row_value_2"
          ANALYTICS_GRAPH_COLUMN_KEY_2    = "column_key_2"
          ANALYTICS_GRAPH_COLUMN_VALUE_2  = "column_value_2"
          ANALYTICS_GRAPH_NAME_2          = "name_2"
          ANALYTICS_GRAPH_DESCRIPTION_2   = "description_2"
          ANALYTICS_GRAPH_FUNC_2          = BOLLINGER_SERIALIZED_HASH_1
          ANALYTICS_GRAPH_ORDER_2         = [BOLLINGER_SERIALIZED_HASH_1[:uuid]]
          ANALYTICS_GRAPH_FUNCTIONS_2     = [ANALYTICS_GRAPH_FUNC_2]



          ANALYTICS_GRAPH_SERIALIZED_HASH_1 = {
            :uuid           => ANALYTICS_GRAPH_UUID_1,
            :row_key        => ANALYTICS_GRAPH_ROW_KEY_1,
            :row_value      => ANALYTICS_GRAPH_ROW_VALUE_1,
            :column_key     => ANALYTICS_GRAPH_COLUMN_KEY_1,
            :column_value   => ANALYTICS_GRAPH_COLUMN_VALUE_1,
            :name           => ANALYTICS_GRAPH_NAME_1,
            :description    => ANALYTICS_GRAPH_DESCRIPTION_1,
            :order          => ANALYTICS_GRAPH_ORDER_1,
            :functions      => ANALYTICS_GRAPH_FUNCTIONS_1
          }

          ANALYTICS_GRAPH_SERIALIZED_HASH_2 = {
            :uuid           => ANALYTICS_GRAPH_UUID_2,
            :row_key        => ANALYTICS_GRAPH_ROW_KEY_2,
            :row_value      => ANALYTICS_GRAPH_ROW_VALUE_2,
            :column_key     => ANALYTICS_GRAPH_COLUMN_KEY_2,
            :column_value   => ANALYTICS_GRAPH_COLUMN_VALUE_2,
            :name           => ANALYTICS_GRAPH_NAME_2,
            :description    => ANALYTICS_GRAPH_DESCRIPTION_2,
            :order          => ANALYTICS_GRAPH_ORDER_2,
            :functions      => ANALYTICS_GRAPH_FUNCTIONS_2
          }
        end
      end
    end
  end
end