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
    end
  end
end