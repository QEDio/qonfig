require 'spec_helper'

describe Qonfig::Views::Partial do
  let(:partial) do
    Qonfig::Views::Partial.new()
  end

  it "creates a uuid" do
    partial.uuid.should_not == nil
  end
end