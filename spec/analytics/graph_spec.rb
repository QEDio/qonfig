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
        graph.keys                  = ANAYLTICS_GRAPH_KEYS_1
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
        graph.uuid.should                       == ANALYTICS_GRAPH_SERIALIZED_HASH_1[:uuid]
        graph.keys.should                       == ANALYTICS_GRAPH_SERIALIZED_HASH_1[:keys]
        graph.name.should                       == ANALYTICS_GRAPH_SERIALIZED_HASH_1[:name]
        graph.description.should                == ANALYTICS_GRAPH_SERIALIZED_HASH_1[:description]
        graph.order.should                      == ANALYTICS_GRAPH_SERIALIZED_HASH_1[:order]

        graph.serializable_functions.should     == ANALYTICS_GRAPH_SERIALIZED_HASH_1[:functions]
      end
    end

    context "checking the higher functions" do
      let(:graph) do
        build(:graph)
      end

      it "should bla" do
        #pp graph
      end
    end
    
  end
end