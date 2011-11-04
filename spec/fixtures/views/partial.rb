module Qonfig
  module Test
    module Fixtures
      module Views
        module Partial
          include Qonfig::Test::Fixtures::Analytics::Graph
          include Qonfig::Test::Fixtures::Views::Base

          VIEW_PARTIAL_GRAPHS = [ANALYTICS_GRAPH_SERIALIZED_HASH_1, ANALYTICS_GRAPH_SERIALIZED_HASH_2]
        end
      end
    end
  end
end