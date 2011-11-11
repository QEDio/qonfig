require 'spec_helper'

describe Qonfig::Analytics::Functions::Base do
  include Qonfig::Test::Db
  include Qonfig::Test::Fixtures::Analytics::Functions::Base

  describe "Base" do
    context "when bulding with no supplied parameters" do
      let(:base) do
        Qonfig::Analytics::Functions::Base.new(:type => TYPE)
      end

      it "sets the correct type" do
        base.type.should == TYPE
      end

      it "sets the default values" do
        base.color.should                 == nil
        base.periodicity.should           == nil
      end

      it "lets you set your values" do
        base.color                                   = COLOR
        base.periodicity                             = PERIODICITY
        
        base.color.should                            == COLOR
        base.periodicity.should                      == PERIODICITY
      end
    end

    context "when building with all parameters including the type" do
      let(:base) do
        Qonfig::Analytics::Functions::Base.
          new(
            :type           => TYPE,
            :color          => COLOR,
            :periodicity    => PERIODICITY,
            :name           => NAME
          )
      end

      it "sets the supplied values" do
        base.type.should                 == TYPE
        base.color.should                == COLOR
        base.periodicity.should          == PERIODICITY
        base.name.should                 == NAME
      end

      it "de/serializes correctly" do
        base.eql?(Qonfig::Analytics::Functions::Base.new(base.serializable_hash))
      end
    end
  end
end