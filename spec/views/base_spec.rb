require 'spec_helper'

describe Qonfig::Views::Base do
  let(:base) do
    Qonfig::Views::Base.new()
  end

  it "creates a uuid" do
    base.uuid.should_not == nil
  end
end