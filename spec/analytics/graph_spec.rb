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
        graph.uuid                  = UUID
        graph.row_key               = ROW_KEY
        graph.row_value             = ROW_VALUE
        graph.column_key            = COLUMN_KEY
        graph.column_value          = COLUMN_VALUE
        graph.name                  = NAME
        graph.order                 = ORDER
        graph.add_functions(FUNCTIONS)

        graph.should == Qonfig::Analytics::Graph.new(graph.serializable_hash)
      end
    end

    context "when building a new graph from a hash" do
      let(:graph) do
        Qonfig::Analytics::Graph.new(GRAPH_SERIALIZED_HASH_1)
      end

      it "should set the correct values" do
        graph.uuid.should                       == UUID
        graph.row_key.should                    == ROW_KEY
        graph.row_value.should                  == ROW_VALUE
        graph.column_key.should                 == COLUMN_KEY
        graph.column_value.should               == COLUMN_VALUE
        graph.name.should                       == NAME
        graph.description.should                == DESCRIPTION
        graph.order.should                      == ORDER
        graph.serializable_functions.should     == FUNCTIONS
      end
    end
  end
end