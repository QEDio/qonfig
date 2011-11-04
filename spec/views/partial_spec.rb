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
      partial.uuid                  = VIEW_BASE_UUID
      partial.name                  = VIEW_BASE_NAME
      partial.order                 = VIEW_BASE_ORDER
      partial.description           = VIEW_BASE_DESCRIPTION
      partial.add_graphs(VIEW_PARTIAL_GRAPHS)

      partial.should == Qonfig::Views::Partial.new(partial.serializable_hash)
    end
  end
end