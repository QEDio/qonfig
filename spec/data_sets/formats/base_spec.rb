require 'spec_helper'

describe Qonfig::DataSets::Formats::Base do
  include Qonfig::Test::Fixtures::DataSets::Formats::Base

  describe "Base" do
    context "when bulding with no supplied parameters" do
      let(:base) do
        Qonfig::DataSets::Formats::Base.new()
      end

      it "lets you set its attributes and de/serializes correctly" do
        base.key                          = FORMATS_BASE_KEY
        base.value                        = FORMATS_BASE_VALUE
        base.key_mapping                  = FORMATS_BASE_KEY_MAPPING
        base.key_functions                = FORMATS_BASE_KEY_FUNCTIONS
        base.value_mappings               = FORMATS_BASE_VALUE_MAPPINGS
        base.value_functions              = FORMATS_BASE_VALUE_FUNCTIONS

        base.key.should                   == FORMATS_BASE_KEY
        base.value.should                 == FORMATS_BASE_VALUE
        base.key_mapping.should           == FORMATS_BASE_KEY_MAPPING
        base.key_functions.should         == FORMATS_BASE_KEY_FUNCTIONS
        base.value_mappings.should        == FORMATS_BASE_VALUE_MAPPINGS
        base.value_functions.should       == FORMATS_BASE_VALUE_FUNCTIONS

        base.should                       == Qonfig::DataSets::Formats::Base.new(base.serializable_hash)
      end
    end
  end
end