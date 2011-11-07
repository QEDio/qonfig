# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Qonfig::Views::Partial do
  include Qonfig::Test::Fixtures::Views::Partial

  context "when bulding a new graph" do
    let(:partial) do
      Qonfig::Views::Partial.new()
    end

    it "generates a uuid if none is set" do
      partial.uuid.should_not == nil
    end

    it "de/serializes correctly" do
      partial.uuid                  = VIEWS_BASE_UUID
      partial.name                  = VIEWS_BASE_NAME
      partial.order                 = VIEWS_BASE_ORDER
      partial.description           = VIEWS_BASE_DESCRIPTION
      partial.add_graphs(VIEWS_PARTIAL_GRAPHS_1)
      partial.add_default_graphs(ANALYTICS_DEFAULT_GRAPH_NO_KEYS_SERIALIZED_HASH_1)

      partial.should == Qonfig::Views::Partial.new(partial.serializable_hash)
    end
  end

  context "when building from a serialized hash" do
    let(:partial) do
      Qonfig::Views::Partial.new(VIEWS_PARTIAL_SERIALIZED_HASH_1)
    end

    it "should create a correct initialized object" do
      partial.uuid.should                       == VIEWS_PARTIAL_UUID_1
      partial.name.should                       == VIEWS_PARTIAL_NAME_1
      partial.description.should                == VIEWS_PARTIAL_DESCRIPTION_1
      partial.order.should                      == VIEWS_PARTIAL_ORDER_1
      partial.serializable_graphs.should        == VIEWS_PARTIAL_GRAPHS_1
      partial.serializable_graphs(partial.default_graphs).should == [ANALYTICS_DEFAULT_GRAPH_NO_KEYS_SERIALIZED_HASH_1]
    end
  end

  context "testing its default matching capabilities" do
    let(:partial) do
      Qonfig::Views::Partial.new(VIEWS_PARTIAL_DEFAULT_SERIALIZED_HASH_1)
    end

    it "should return the default graph for no key at all" do
      partial.get_graph.
        serializable_hash.should                  == ANALYTICS_DEFAULT_GRAPH_NO_KEYS_SERIALIZED_HASH_1
    end

    it "should return the default graph for row_key" do
      partial.get_graph(:row_key => ANALYTICS_GRAPH_DEFAULT_ROW_KEY_2).
        serializable_hash.should == ANALYTICS_DEFAULT_GRAPH_ROW_KEY_SERIALIZED_HASH_1
    end

    it "should return the default graph for row_key and row_value" do
      partial.get_graph(
        :row_key        => ANALYTICS_GRAPH_DEFAULT_ROW_KEY_3,
        :row_value      => ANALYTICS_GRAPH_DEFAULT_ROW_VALUE_3
      ).serializable_hash.should == ANALYTICS_DEFAULT_GRAPH_ROW_KEY_ROW_VALUE_SERIALIZED_HASH_1
    end

    it "should return the default graph for row_key, row_value and column_key" do
      partial.get_graph(
        :row_key        => ANALYTICS_GRAPH_DEFAULT_ROW_KEY_4,
        :row_value      => ANALYTICS_GRAPH_DEFAULT_ROW_VALUE_4,
        :column_key     => ANALYTICS_GRAPH_DEFAULT_COLUMN_KEY_4
      ).serializable_hash.should == ANALYTICS_DEFAULT_GRAPH_ROW_KEY_ROW_VALUE_COLUMN_KEY_SERIALIZED_HASH_1
    end
  end

  context "testing it's default merging capabilities" do
    let(:partial) do
      Qonfig::Views::Partial.new(VIEWS_PARTIAL_SERIALIZED_HASH_3)
    end

    it "should return the merged contents of the matching default config and graph config" do
      graph = partial.get_graph(
        :row_key      => ANALYTICS_GRAPH_ROW_KEY_1,
        :row_value    => ANALYTICS_GRAPH_ROW_VALUE_1,
        :column_key   => ANALYTICS_GRAPH_COLUMN_KEY_1,
        :with_defaults=> true
      )
      
      graph.serializable_hash.should_not  == ANALYTICS_GRAPH_SERIALIZED_HASH_3
      graph.serializable_hash.should_not  == ANALYTICS_DEFAULT_GRAPH_NO_KEYS_SERIALIZED_HASH_1

      ####### fine checking,
      #### from configured graph
      graph.uuid.should                   == ANALYTICS_GRAPH_SERIALIZED_HASH_3[:uuid]
      graph.row_key.should                == ANALYTICS_GRAPH_SERIALIZED_HASH_3[:row_key]
      graph.row_value.should              == ANALYTICS_GRAPH_SERIALIZED_HASH_3[:row_value]
      graph.column_key.should             == ANALYTICS_GRAPH_SERIALIZED_HASH_3[:column_key]

      #### from default graph
      graph.name.should                   == ANALYTICS_DEFAULT_GRAPH_NO_KEYS_SERIALIZED_HASH_1[:name]
      graph.description.should            == ANALYTICS_DEFAULT_GRAPH_NO_KEYS_SERIALIZED_HASH_1[:description]
      graph.serializable_functions.should == ANALYTICS_DEFAULT_GRAPH_NO_KEYS_SERIALIZED_HASH_1[:functions]
    end
  end
end