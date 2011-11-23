require 'spec_helper'

describe Qonfig::DataSets::Sortings::Base do
  include Qonfig::Test::Fixtures::DataSets::Sortings::Base

  describe "Base" do
    context "when bulding with no supplied parameters" do
      let(:base) do
        Qonfig::DataSets::Sortings::Base.new()
      end

      it "lets you set its attributes and de/serializes correctly" do
        base.key                          = SORTINGS_BASE_KEY
        base.functions                    = SORTINGS_BASE_FUNCTIONS

        base.key.should                   == SORTINGS_BASE_KEY
        base.functions.should             == SORTINGS_BASE_FUNCTIONS

        base.should                       == Qonfig::DataSets::Sortings::Base.new(base.serializable_hash)
      end
    end
  end
end