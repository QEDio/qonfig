require 'spec_helper'

describe Qonfig::Analytics::Graph do
  include Qonfig::Test::Fixtures::Analytics::Graph

  describe "Graph" do
    context "when bulding a new graph" do
      let(:graph) do
        Qonfig::Analytics::Graph.new()
      end

      it "generates a uuid if none is set" do
        graph.uuid.should_not == nil
      end

      it "de/serializes correctly" do
        graph.uuid                  = ANALYTICS_GRAPH_UUID_1
        graph.row_key               = ANALYTICS_GRAPH_ROW_KEY_1
        graph.row_value             = ANALYTICS_GRAPH_ROW_VALUE_1
        graph.column_key            = ANALYTICS_GRAPH_COLUMN_KEY_1
        graph.column_value          = ANALYTICS_GRAPH_COLUMN_VALUE_1
        graph.name                  = ANALYTICS_GRAPH_NAME_1
        graph.order                 = ANALYTICS_GRAPH_ORDER_1
        graph.add_functions(ANALYTICS_GRAPH_FUNCTIONS_1)

        graph.should == Qonfig::Analytics::Graph.new(graph.serializable_hash)
      end
    end

    context "when building a new graph from a hash" do
      let(:graph) do
        Qonfig::Analytics::Graph.new(ANALYTICS_GRAPH_SERIALIZED_HASH_1)
      end

      it "should set the correct values" do
        graph.uuid.should                       == ANALYTICS_GRAPH_UUID_1
        graph.row_key.should                    == ANALYTICS_GRAPH_ROW_KEY_1
        graph.row_value.should                  == ANALYTICS_GRAPH_ROW_VALUE_1
        graph.column_key.should                 == ANALYTICS_GRAPH_COLUMN_KEY_1
        graph.column_value.should               == ANALYTICS_GRAPH_COLUMN_VALUE_1
        graph.name.should                       == ANALYTICS_GRAPH_NAME_1
        graph.description.should                == ANALYTICS_GRAPH_DESCRIPTION_1
        graph.order.should                      == ANALYTICS_GRAPH_ORDER_1
        graph.serializable_functions.should     == ANALYTICS_GRAPH_FUNCTIONS_1
      end
    end
  end
end