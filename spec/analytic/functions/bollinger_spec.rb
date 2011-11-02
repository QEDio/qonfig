require 'spec_helper'

describe Qonfig::Analytics::Functions::Bollinger do
  include Qonfig::Test::Db

  let(:bollinger) do
    Qonfig::Analytics::Functions::Bollinger.new()
  end

  it "should set the correct type" do
    bollinger.type.should == Qonfig::Analytics::Functions::Bollinger::TYPE
  end
end