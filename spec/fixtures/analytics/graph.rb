module Qonfig
  module Test
    module Fixtures
      module Analytics
        module Graph
          include Qonfig::Test::Fixtures::Analytics::Functions::Bollinger

          UUID          = "keine"
          ROW_KEY       = "row_key"
          ROW_VALUE     = "row_value"
          COLUMN_KEY    = "column_key"
          COLUMN_VALUE  = "column_value"
          NAME          = "name"
          DESCRIPTION   = "description"

          FUNC1         = BOLLINGER_SERIALIZED_HASH_1

          ORDER         = [BOLLINGER_SERIALIZED_HASH_1[:uuid]]
          FUNCTIONS     = [FUNC1]

          GRAPH_SERIALIZED_HASH_1 = {
            :uuid           => UUID,
            :row_key        => ROW_KEY,
            :row_value      => ROW_VALUE,
            :column_key     => COLUMN_KEY,
            :column_value   => COLUMN_VALUE,
            :name           => NAME,
            :description    => DESCRIPTION,
            :order          => ORDER,
            :functions      => FUNCTIONS
          }
        end
      end
    end
  end
end