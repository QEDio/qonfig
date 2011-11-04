require 'spec_helper'

describe Qonfig::Factory do
  include Qonfig::Test::Fixtures::Views::View

  it "should create a view object" do
    pp VIEWS_VIEW_SERIALIZED_HASH_1
    Qonfig::Factory.build(VIEWS_VIEW_SERIALIZED_HASH_1).class.should == Qonfig::Views::View
  end
end