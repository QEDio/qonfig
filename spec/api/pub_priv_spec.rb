# -*- encoding: utf-8 -*-
require 'spec_helper'
require 'openssl'

describe Qonfig::Api::PubPriv do
  include Qonfig::Test::Db

  let(:pub_priv) do
    Qonfig::Analytic.new(
      :user         => "user",
      :datasource   => Qonfig::Db.new(:data => CONFIG_DATA)).api.pub_priv
  end

  it "should have created the pub_priv objects" do
    pub_priv.class.should == Qonfig::Api::PubPriv
  end

  it "should be able to encrypt/decrypt with pub/priv key" do
    private_key  = OpenSSL::PKey::RSA.new(pub_priv.private_key, '')
    public_key   = OpenSSL::PKey::RSA.new(pub_priv.public_key)

    str = "Ein Pferd frisst keinen Gurkensalat"

    private_key.private_decrypt(public_key.public_encrypt(str)).should == str
  end
end
