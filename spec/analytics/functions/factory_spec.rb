require 'spec_helper'

describe Qonfig::Analytics::Functions::Factory do
  it "should return the requested function objects" do
    bollinger_func = Qonfig::Analytics::Functions::Factory.build(:id => "abc", :type => Qonfig::Analytics::Functions::Bollinger)
    bollinger_func.class.should == Qonfig::Analytics::Functions::Bollinger
  end
end