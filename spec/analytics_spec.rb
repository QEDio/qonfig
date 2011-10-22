require 'spec_helper'

describe Qonfig::Analytics do
  include Qonfig::Test::Db

  let(:analytics) do
    Qonfig::Analytics.new(
      :user         => "user",
      :view         => "view",
      :datasource   => Qonfig::Db.new(:data => CONFIG_DATA))
  end

  it "should return the bollinger data" do
    analytics.bollinger.should == CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]
  end

  it "should return the bollinger row" do
    analytics.bollinger_row("campaign_product", "Solaranlage").
      should ==  CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]["rows"]["campaign_product"]["Solaranlage"]
  end

  it "should return nil for this row" do
    analytics.bollinger_row("campaign_product", "XYZ").should == nil
  end

  it "should return the bollinger column merged with the default config" do
    analytics.bollinger_column("campaign_product", "Solaranlage", "cr").
      should == CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]["defaults"]["columns"]["cr"].
                  merge(CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]["rows"]["campaign_product"]["Solaranlage"]["columns"]["cr"])
  end

  it "should return nil for this column" do
    analytics.bollinger_column("campaign_product", "ZYX", "cr").should == nil
  end

  it "should return the default bollinger column" do
    analytics.bollinger_defaults("columns", "cr").
      should == CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]["defaults"]["columns"]["cr"]
  end

  it "should return nil for this default" do
    analytics.bollinger_defaults("columns", "xyz").should == nil
  end

  it "should return the column config without the default config" do
    analytics.bollinger_column("campaign_product", "Solaranlage", "cr", :merge_with_defaults => false).
      should == CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]["rows"]["campaign_product"]["Solaranlage"]["columns"]["cr"]
  end
end