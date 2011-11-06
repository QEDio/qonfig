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

          ANALYTICS_GRAPH_DEFAULT_UUID_1                  = "default_uuid_1"
          ANALYTICS_GRAPH_DEFAULT_NAME_1                  = "default_name_1"
          ANALYTICS_GRAPH_DEFAULT_DESCRIPTION_1           = "default_description_1"
          ANALYTICS_GRAPH_DEFAULT_FUNC_1                  = BOLLINGER_DEFAULT_SERIALIZED_HASH_1
          ANALYTICS_GRAPH_DEFAULT_ORDER_1                 = [BOLLINGER_DEFAULT_SERIALIZED_HASH_1[:uuid]]
          ANALYTICS_GRAPH_DEFAULT_FUNCTIONS_1             = [ANALYTICS_GRAPH_DEFAULT_FUNC_1]

          ANALYTICS_GRAPH_DEFAULT_UUID_2                  = "default_uuid_2"
          ANALYTICS_GRAPH_DEFAULT_NAME_2                  = "default_name_2"
          ANALYTICS_GRAPH_DEFAULT_DESCRIPTION_2           = "default_description_2"
          ANALYTICS_GRAPH_DEFAULT_FUNC_2                  = BOLLINGER_DEFAULT_SERIALIZED_HASH_1
          ANALYTICS_GRAPH_DEFAULT_ORDER_2                 = [BOLLINGER_DEFAULT_SERIALIZED_HASH_1[:uuid]]
          ANALYTICS_GRAPH_DEFAULT_FUNCTIONS_2             = [ANALYTICS_GRAPH_DEFAULT_FUNC_1]
          ANALYTICS_GRAPH_DEFAULT_ROW_KEY_2               = ANALYTICS_GRAPH_ROW_KEY_1

          ANALYTICS_GRAPH_DEFAULT_UUID_3                  = "default_uuid_3"
          ANALYTICS_GRAPH_DEFAULT_NAME_3                  = "default_name_3"
          ANALYTICS_GRAPH_DEFAULT_DESCRIPTION_3           = "default_description_3"
          ANALYTICS_GRAPH_DEFAULT_FUNC_3                  = BOLLINGER_DEFAULT_SERIALIZED_HASH_1
          ANALYTICS_GRAPH_DEFAULT_ORDER_3                 = [BOLLINGER_DEFAULT_SERIALIZED_HASH_1[:uuid]]
          ANALYTICS_GRAPH_DEFAULT_FUNCTIONS_3             = [ANALYTICS_GRAPH_DEFAULT_FUNC_1]
          ANALYTICS_GRAPH_DEFAULT_ROW_KEY_3               = ANALYTICS_GRAPH_ROW_KEY_1
          ANALYTICS_GRAPH_DEFAULT_ROW_VALUE_3             = ANALYTICS_GRAPH_ROW_VALUE_1

          ANALYTICS_GRAPH_DEFAULT_UUID_4                  = "default_uuid_4"
          ANALYTICS_GRAPH_DEFAULT_NAME_4                  = "default_name_4"
          ANALYTICS_GRAPH_DEFAULT_DESCRIPTION_4           = "default_description_3"
          ANALYTICS_GRAPH_DEFAULT_FUNC_4                  = BOLLINGER_DEFAULT_SERIALIZED_HASH_1
          ANALYTICS_GRAPH_DEFAULT_ORDER_4                 = [BOLLINGER_DEFAULT_SERIALIZED_HASH_1[:uuid]]
          ANALYTICS_GRAPH_DEFAULT_FUNCTIONS_4             = [ANALYTICS_GRAPH_DEFAULT_FUNC_1]
          ANALYTICS_GRAPH_DEFAULT_ROW_KEY_4               = ANALYTICS_GRAPH_ROW_KEY_1
          ANALYTICS_GRAPH_DEFAULT_ROW_VALUE_4             = ANALYTICS_GRAPH_ROW_VALUE_1
          ANALYTICS_GRAPH_DEFAULT_COLUMN_KEY_4            = ANALYTICS_GRAPH_COLUMN_KEY_1


          ANALYTICS_GRAPH_SERIALIZED_HASH_1 = {
            :type           => Qonfig::Analytics::Graph.to_s,
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
            :type           => Qonfig::Analytics::Graph.to_s,
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

          ANALYTICS_DEFAULT_GRAPH_NO_KEYS_SERIALIZED_HASH_1 = {
            :type           => Qonfig::Analytics::Graph.to_s,
            :uuid           => ANALYTICS_GRAPH_DEFAULT_UUID_1,
            :name           => ANALYTICS_GRAPH_DEFAULT_NAME_1,
            :description    => ANALYTICS_GRAPH_DEFAULT_DESCRIPTION_1,
            :order          => ANALYTICS_GRAPH_DEFAULT_ORDER_1,
            :functions      => ANALYTICS_GRAPH_DEFAULT_FUNCTIONS_1
          }

          ANALYTICS_DEFAULT_GRAPH_ROW_KEY_SERIALIZED_HASH_1 = {
            :type           => Qonfig::Analytics::Graph.to_s,
            :uuid           => ANALYTICS_GRAPH_DEFAULT_UUID_2,
            :row_key        => ANALYTICS_GRAPH_DEFAULT_ROW_KEY_2,
            :name           => ANALYTICS_GRAPH_DEFAULT_NAME_2,
            :description    => ANALYTICS_GRAPH_DEFAULT_DESCRIPTION_2,
            :order          => ANALYTICS_GRAPH_DEFAULT_ORDER_2,
            :functions      => ANALYTICS_GRAPH_DEFAULT_FUNCTIONS_2
          }

          ANALYTICS_DEFAULT_GRAPH_ROW_KEY_ROW_VALUE_SERIALIZED_HASH_1 = {
            :type           => Qonfig::Analytics::Graph.to_s,
            :uuid           => ANALYTICS_GRAPH_DEFAULT_UUID_3,
            :row_key        => ANALYTICS_GRAPH_DEFAULT_ROW_KEY_3,
            :row_value      => ANALYTICS_GRAPH_DEFAULT_ROW_VALUE_3,
            :name           => ANALYTICS_GRAPH_DEFAULT_NAME_3,
            :description    => ANALYTICS_GRAPH_DEFAULT_DESCRIPTION_3,
            :order          => ANALYTICS_GRAPH_DEFAULT_ORDER_3,
            :functions      => ANALYTICS_GRAPH_DEFAULT_FUNCTIONS_3
          }

          ANALYTICS_DEFAULT_GRAPH_ROW_KEY_ROW_VALUE_COLUMN_KEY_SERIALIZED_HASH_1 = {
            :type           => Qonfig::Analytics::Graph.to_s,
            :uuid           => ANALYTICS_GRAPH_DEFAULT_UUID_4,
            :row_key        => ANALYTICS_GRAPH_DEFAULT_ROW_KEY_4,
            :row_value      => ANALYTICS_GRAPH_DEFAULT_ROW_VALUE_4,
            :column_key     => ANALYTICS_GRAPH_DEFAULT_COLUMN_KEY_4,
            :name           => ANALYTICS_GRAPH_DEFAULT_NAME_4,
            :description    => ANALYTICS_GRAPH_DEFAULT_DESCRIPTION_4,
            :order          => ANALYTICS_GRAPH_DEFAULT_ORDER_4,
            :functions      => ANALYTICS_GRAPH_DEFAULT_FUNCTIONS_4
          }
        end
      end
    end
  end
end