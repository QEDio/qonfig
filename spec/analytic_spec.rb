# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Qonfig::Analytic do
  include Qonfig::Test::Db

  let(:view) do
    Qonfig::Analytic.new(
      :user         => "user",
      :datasource   => Qonfig::Db.new(:data => CONFIG_DATA)).view("view")
  end

  it "should create the view config for me" do
    view.class.should == Qonfig::Views::View
  end

  it "should create the partial config for me" do
    view.partials.size.should == 1
    #pp view.partials
    view.partials["views_partial_uuid_1"].class.should == Qonfig::Views::Partial
  end

  it "should create the graphs in the partial for me" do
    graphs = view.partials["views_partial_uuid_1"].graphs
    
    graphs.size.should == 6
    graphs["graph_uuid_1"].class.should == Qonfig::Analytics::Graph
  end

  it "should create the functions in the graphs in the partials in the view for me" do
    graphs    = view.partials["views_partial_uuid_1"].graphs["graph_uuid_1"]
    functions = graphs.functions

    #puts functions.inspect
    functions.size.should == 2
    functions["error_uuid"].class.should == Qonfig::Analytics::Functions::Bollinger
  end
end