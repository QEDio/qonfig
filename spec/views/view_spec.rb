require 'spec_helper'

describe Qonfig::Views::View do
  include Qonfig::Test::Fixtures::Views::View
  
  let(:view) do
    Qonfig::Views::View.new()
  end

  it "creates a uuid" do
    view.uuid.should_not == nil
  end
  
  it "de/serializes correctly" do
    view.uuid                   = VIEWS_VIEW_UUID_1
    view.name                   = VIEWS_VIEW_NAME_1
    view.description            = VIEWS_VIEW_DESCRIPTION_1
    view.order                  = VIEWS_VIEW_ORDER_1
    view.add_partials(VIEWS_VIEW_PARTIALS_1)

    Qonfig::Views::View.new(view.serializable_hash).should == view
  end

  context "when building a new view from a hash" do
    let(:view) do
      Qonfig::Views::View.new(VIEWS_VIEW_SERIALIZED_HASH_1)
    end

    it "should set the correct values" do
      view.uuid.should                        == VIEWS_VIEW_UUID_1
      view.name.should                        == VIEWS_VIEW_NAME_1
      view.description.should                 == VIEWS_VIEW_DESCRIPTION_1
      view.order.should                       == VIEWS_VIEW_ORDER_1
      view.serializable_partials.should       == VIEWS_VIEW_PARTIALS_1
    end
  end
end