# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Qonfig::Api::Api do
  include Qonfig::Test::Db

  let(:api) do
    Qonfig::Analytic.new(
      :user         => "user",
      :datasource   => Qonfig::Db.new(:data => CONFIG_DATA)).api
  end

  it "should have created the api objects" do
    # just make sure they are here, each class is tested thoroughly on its own
    api.pub_priv.class.should == Qonfig::Api::PubPriv
    api.database.class.should == Qonfig::Api::Database
  end
end

