require 'spec_helper'

describe Qonfig::Analytic do
  include Qonfig::Test::Db

  let(:analytics) do
    Qonfig::Analytic.new(
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

  it "should return {} for this row" do
    analytics.bollinger_row("campaign_product", "XYZ").should == {}
  end

  it "should return the bollinger column merged with the default config" do
    analytics.bollinger_column("campaign_product", "Solaranlage", "cr").
      should == {"alert" =>
                  CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]["defaults"]["columns"]["cr"]["alert"].merge(CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]["rows"]["campaign_product"]["Solaranlage"]["columns"]["cr"]["alert"])}.
                merge({"warn" => CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]["defaults"]["columns"]["cr"]["warn"].merge(CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]["rows"]["campaign_product"]["Solaranlage"]["columns"]["cr"]["warn"]||{})})
  end

  it "should return the default configuration for cr" do
    analytics.bollinger_column("campaign_product", "ZYX", "cr").
      should == CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]["defaults"]["columns"]["cr"]
  end

  it "should return the default bollinger column" do
    analytics.bollinger_defaults(:type => "columns", :key => "cr").
      should == CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]["defaults"]["columns"]["cr"]
  end

  it "should return {} for this default" do
    analytics.bollinger_defaults(:type => "columns", :key => "xyz").should == {}
  end

  it "should return the column config without the default config" do
    analytics.bollinger_column("campaign_product", "Solaranlage", "cr", :merge_with_defaults => false).
      should == CONFIG_DATA["user"]["view"]["analytics"]["bollinger"]["rows"]["campaign_product"]["Solaranlage"]["columns"]["cr"]
  end

  it "should set the default value for all known bollinger params" do
    i = 0

    ["cr", "conversion"].each do |col|
      analytics.bollinger["order"].each_pair do |band, index|
        Qonfig::Analytic.bollinger_params.each_with_index do |param, j|
          analytics.set_bollinger_default("columns", col, {band => {param => i+j}})
        end
      end

      Qonfig::Analytic.bollinger_params.each_with_index do |param, j|
        analytics.bollinger["order"].each_pair do |band, order|
          analytics.bollinger_defaults(:type => "columns", :key => col)[band][param].should == i + j
        end
      end
      i += 100
    end
  end

  it "should set factor to the value" do
    puts "orig: #{analytics.bollinger_column("campaign_product", "Solaranlage", "conversions")}"
    #analytics.set_bollinger_column("campaign_product", "Solaranlage", "cr", {"alert"=>{"factor"=>99, "nr_values"=>9}, "warn"=>{"factor"=>11, "nr_values"=>17}})
    analytics.set_bollinger_column("campaign_product", "Solaranlage", "conversions", {"alert"=>{"factor"=>5, "nr_values"=>5}, "warn"=>{"factor"=>1, "nr_values"=>10, "data_points"=>"weekly"}})

    puts analytics.bollinger_column("campaign_product", "Solaranlage", "conversions")
  end
end