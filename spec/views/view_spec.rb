require 'spec_helper'

describe Qonfig::Views::View do
  let(:view) do
    Qonfig::Views::View.new()
  end

  it "creates a uuid" do
    view.uuid.should_not == nil
  end
end