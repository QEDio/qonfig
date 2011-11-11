require 'spec_helper'

describe Qonfig::Views::Base do
  let(:base) do
    Qonfig::Views::Base.new(:type => "fake")
  end

  it "creates a uuid" do
    base.uuid.should_not == nil
  end
end