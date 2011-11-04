require 'spec_helper'

describe Qonfig::Analytics::Functions::Bollinger do
  include Qonfig::Test::Db
  include Qonfig::Test::Fixtures::Analytics::Functions::Bollinger

  describe "Bolligner" do
    context "when bulding with no supplied parameters" do
      let(:bollinger) do
        Qonfig::Analytics::Functions::Bollinger.new()
      end

      it "sets the correct type" do
        bollinger.type.should == Qonfig::Analytics::Functions::Bollinger.to_s
      end

      it "sets the default values" do
        bollinger.deviation_factor.should                 == Qonfig::Analytics::Functions::Bollinger::DEFAULT_DEVIATION_FACTOR
        bollinger.deviation_type.should                   == Qonfig::Analytics::Functions::Bollinger::DEFAULT_DEVIATION_TYPE
        bollinger.number_of_values_moving_average.should  == Qonfig::Analytics::Functions::Bollinger::DEFAULT_NUMBER_OF_VALUES_MOVING_AVERAGE
      end

      it "lets you set your values" do
        bollinger.deviation_factor                        = DEVIATION_FACTOR
        bollinger.deviation_type                          = DEVIATION_TYPE
        bollinger.number_of_values_moving_average         = NUMBER_OF_VALUES_MOVING_AVERAGE
        bollinger.color                                   = COLOR
        bollinger.periodicity                             = PERIODICITY


        bollinger.deviation_factor.should                 == DEVIATION_FACTOR
        bollinger.deviation_type.should                   == DEVIATION_TYPE
        bollinger.number_of_values_moving_average.should  == NUMBER_OF_VALUES_MOVING_AVERAGE
        bollinger.color.should                            == COLOR
        bollinger.periodicity.should                      == PERIODICITY
      end
    end

    context "when building with all parameters including the type" do
      let(:bollinger) do
        Qonfig::Analytics::Functions::Bollinger.new(
          :type                             => TYPE,
          :deviation_type                   => DEVIATION_TYPE,
          :deviation_factor                 => DEVIATION_FACTOR,
          :number_of_values_moving_average  => NUMBER_OF_VALUES_MOVING_AVERAGE,
          :color                            => COLOR,
          :periodicity                      => PERIODICITY,
          :name                             => NAME
        )
      end

      it "set the type to the 'bollinger' regardless of the supplied type" do
        bollinger.type.should == Qonfig::Analytics::Functions::Bollinger.to_s
      end

      it "set the supplied values" do
        bollinger.deviation_factor.should                 == DEVIATION_FACTOR
        bollinger.deviation_type.should                   == DEVIATION_TYPE
        bollinger.number_of_values_moving_average.should  == NUMBER_OF_VALUES_MOVING_AVERAGE
        bollinger.color.should                            == COLOR
        bollinger.periodicity.should                      == PERIODICITY
        bollinger.name.should                             == NAME
      end

      it "serializes all data" do
        bollinger.serializable_hash.eql?(BOLLINGER_SERIALIZED_HASH_1)
      end

      it "de/serializes correctly" do
        bollinger.eql?(Qonfig::Analytics::Functions::Bollinger.new(bollinger.serializable_hash))
      end
    end
  end
end