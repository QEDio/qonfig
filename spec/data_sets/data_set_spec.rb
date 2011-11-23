require 'spec_helper'

describe Qonfig::DataSets::DataSet do
  include Qonfig::Test::Db

  context "when creating a new dataset object from hash" do
    let(:dataset) do
      @dataset_hsh = CONFIG_DATA["user"]["view"]["partials"][0]["data_set"].symbolize_keys_rec
      Qonfig::DataSets::DataSet.new(@dataset_hsh)
    end

    it "should be created correctly" do
      dataset.formatings.size.should   == 2
      dataset.sortings.size.should     == 1

      dataset.formatings.each do |formating|
        formating.present?.should == true
      end

      dataset.sortings.each do |sorting|
        sorting.present?.should == true
      end
    end
  end

  context "when creating a new dataset object without any params" do
    let(:dataset) do
      Qonfig::DataSets::DataSet.new
    end

    # TOOD: this sucks, it should be empty == 0
    it "should return one element for formatings" do
      dataset.formatings.size.should == 1
    end

    it "should return blank? == true for the only formatings element" do
      dataset.formatings[0].blank?.should == true
    end

    # TOOD: this sucks, it should be empty == 0
    it "should return one element for sortings" do
      dataset.sortings.size.should == 1
    end

    it "should return blank? == true for the only sortings element" do
      dataset.sortings[0].blank?.should == true
    end
  end
end