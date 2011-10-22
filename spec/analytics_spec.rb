require 'spec_helper'

describe Qonfig::Analytics do
  include Qonfig::Test::Db

  let(:analytics) do
    Qonfig::Analytics.new(
      :user         => :user,
      :view         => :view,
      :datasource   => Qonfig::Db.new(:data => CONFIG_DATA))
  end

  it "should return the bollinger data" do
    analytics.bollinger.should == CONFIG_DATA[:user][:view][:analytics][:bollinger]
  end

  it "should return the bollinger row" do
    analytics.bollinger_row(:campaign_product, "Solaranlage").
      should ==  CONFIG_DATA[:user][:view][:analytics][:bollinger][:rows].first
  end

  it "should return the bollinger column" do
    analytics.bollinger_column(:campaign_product, "Solaranlage", :cr).
      should ==  CONFIG_DATA[:user][:view][:analytics][:bollinger][:rows].first[:columns].first
  end

  it "should return the default bollinger column" do
    analytics.bollinger_defaults(:columns, :cr).
      should == CONFIG_DATA[:user][:view][:analytics][:bollinger][:defaults][:columns].first
  end
end