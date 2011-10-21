require 'spec_helper'

describe Qonfig::Analytics do
  include Qonfig::Test::Db

  let(:analytics) do
    Qonfig::Analytics.new(
      :user     => :test,
      :view     => :view,
      :database => Qonfig::Db.new(:data => DATA))
  end

  it "should return the bollinger data" do
    analytics.bollinger.should == DATA[:test][:view][:analytics][:bollinger]
  end

  it "should return the bollinger row" do
    analytics.bollinger_row(:campaign_product, "Solaranlage").
      should ==  DATA[:test][:view][:analytics][:bollinger][:rows].first
  end

  it "should return the bollinger column" do
    analytics.bollinger_column(:campaign_product, "Solaranlage", :cr).
      should ==  DATA[:test][:view][:analytics][:bollinger][:rows].first[:columns].first
  end
end