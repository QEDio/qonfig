# -*- encoding: utf-8 -*-
require 'spec_helper'
require 'openssl'

describe Qonfig::Api::Database do
  include Qonfig::Test::Db

  let(:database) do
    Qonfig::Analytic.new(
      :user         => "user",
      :datasource   => Qonfig::Db.new(:data => CONFIG_DATA)).api.database
  end

  it "should have created the pub_priv objects" do
    database.class.should == Qonfig::Api::Database
  end
end
